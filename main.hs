import Yesod
import Database.Persist.Postgresql
import Data.Text hiding (replace)
import Control.Monad.Logger (runStdoutLoggingT)
             
data App = App{connPool :: ConnectionPool}

instance Yesod App

share [mkPersist sqlSettings, mkMigrate "migrateAll"] [persistLowerCase|

Paciente json
    nome Text
    idade Int
    cpf Text
   deriving Show
Prontuario
    pacienteId PacienteId
    medicoId MedicoId
    hospitalId HospitalId
    dat Text
    deriving Show
ProntuarioEnfermidade
    prontuarioId ProntuarioId
    enfermidadeId EnfermidadeId  -- possivel datatype enum
    deriving Show
Enfermidade
   cid Text --possivel tipo
   deriving Show
Medico
    nome Text
    idade Int
    cpf Text
    crm Text
    especializacao Text
    deriving Show
Hospital
    nome Text
    cnpj Text
    medicoId MedicoId
    deriving Show
|]

--yesod despatcher
mkYesod "App" [parseRoutes| 
/                                                   HomeR                       GET
        
!/paciente/#PacienteId                              PacienteBuscarR             GET 
/paciente/listarPacientes                           PacienteListarR             GET
/paciente/inserir                                   PacienteInserirR            POST
/paciente/alterar/#PacienteId                       PacienteAlterarR            PUT
/paciente/remover/#PacienteId                       PacienteRemoverR            DELETE
        
/medico/#MedicoId                                   MedicoBuscarR               GET
/medico/listarMedicos                               MedicosListarR              GET
/medico/inserir                                     MedicoInserirR              POST
/medico/alterar/#MedicoId                           MedicoAlterarR              PUT

/hospital/#HospitalId                               HospitalBuscarR             GET
/hospital/listarHospitais                           HospitalListarR             GET
/hospital/inserir                                   HospitalInserirR            POST
/hospital/alterar/#HospitalId                       HospitalAlterarR            PUT

/enfermidade/#EnfermidadeId                         EnfermidadeBuscarR          GET

/prontuario/#ProntuarioId                           ProntuarioBuscarR           GET
/prontuario/listarProntuarios                       ProntuariosListarR          GET
/prontuario/inserir                                 ProntuarioInserirR          POST

|]

--HANDLERS
getHomeR :: Handler ()
getHomeR = undefined
                                    --handler vai definir qual mimetype 
getPacienteBuscarR :: PacienteId -> Handler Value
getPacienteBuscarR pid = do
    paciente <- runDB $ get404 pid
    sendResponse ( object [pack "resp" .= toJSON paciente ])

getPacienteListarR :: Handler Value
getPacienteListarR = do
    pacientes <- runDB $ selectList [] [Asc PacienteNome]
    sendResponse ( object [pack "resp" .= toJSON paciente ])

postPacienteInserirR :: Handler ()
postPacienteInserirR = do
    paciente <- requireJsonBody :: Handler Paciente
    pid <- runDB $ insert paciente
    sendResponse ( object [pack "resp" .= pack "Paciente inserido com sucesso" ])
    

putPacienteAlterarR :: PacienteId -> Handler ()
putPacienteAlterarR pid = do
    paciente <- requireJsonBody :: Handler Paciente
    runDB $ replace pid paciente
    sendResponse ( object [pack "resp" .= pack "Paciente atualizado com sucesso" ])

deletePacienteRemoverR :: PacienteId -> Handler ()
deletePacienteRemoverR pid = undefined
-------------------------------------
getMedicoBuscarR :: MedicoId -> Handler Value
getMedicoBuscarR mid = do
    medico <- runDB $ get404 mid
    sendResponse ( object [pack "resp" .= toJSON medico ])

getMedicoListarR :: Handler Value
getMedicoListarR = do
    medico <- runDB $ selectList [] [Asc MedicoNome]
    sendResponse ( object [pack "resp" .= toJSON medico ])
    

postMedicoInserirR :: Handler ()
postMedicoInserirR = do
    medico <- requireJsonBody :: Handler Medico
    mid <- runDB $ insert medico
    sendResponse ( object [pack "resp" .= pack "Medico inserido com sucesso" ])
    

putMedicoAlterarR :: MedicoId -> Handler ()
putMedicoAlterarR mid = do
    medico <- requireJsonBody :: Handler Medico
    runDB $ replace mid medico
    sendResponse ( object [pack "resp" .= pack "Medico atualizado com sucesso" ])
--------------------------------------------------------------------------------------------------

getHospitalBuscarR :: PacienteId -> Handler Value
getHospitalBuscarR hid = do
    hospital <- runDB $ get404 pid
    sendResponse ( object [pack "resp" .= toJSON hospital ])

getHospitalListarR :: Handler Value
getHospitalListarR = do
    hospital <- runDB $ selectList [] [Asc HospitalNome]
    sendResponse ( object [pack "resp" .= toJSON hospital ])

postHospitalInserirR :: Handler ()
postHospitalInserirR = do
    hospital <- requireJsonBody :: Handler Hospital
    hid <- runDB $ insert hospital
    sendResponse ( object [pack "resp" .= pack "Hospital inserido com sucesso" ])
    

putHospitalAlterarR :: HospitalId -> Handler ()
putHospitalAlterarR hid = do
    hospital <- requireJsonBody :: Handler Hospital
    runDB $ replace hid hospital
    sendResponse ( object [pack "resp" .= pack "Hospital atualizado com sucesso" ])
---------------------------------------------------------------------------------------------VERIFICAR

getProntuarioBuscarR :: ProntuarioId -> Handler Value
getProntuarioBuscarR prid = do
    prontuario <- runDB $ get404 prid
    sendResponse ( object [pack "resp" .= toJSON prontuario ])

getProntuarioListarR :: Handler Value
getProntuarioListarR = do
    prontuario <- runDB $ selectList [] [Asc ProntuarioNome]
    sendResponse ( object [pack "resp" .= toJSON prontuario ])

postProntuarioInserirR :: Handler ()
postProntuarioInserirR = do
    prontuario <- requireJsonBody :: Handler Prontuario
    prid <- runDB $ insert prontuario
    sendResponse ( object [pack "resp" .= pack "Prontuario inserido com sucesso" ])


instance YesodPersist App where
   type YesodPersistBackend App = SqlBackend
   runDB f = do
       master <- getYesod
       let pool = connPool master
       runSqlPool f pool
------------------------------------------------------



connStr = "dbname=dbs10j40oj2r50 host=ec2-54-225-95-99.compute-1.amazonaws.com user=ywzfzssfskwcju password=QOoBT4kER9KgAod70niCY3T6tB port=5432"

main::IO()
main = runStdoutLoggingT $ withPostgresqlPool connStr 10 $ \pool -> liftIO $ do 
       runSqlPersistMPool (runMigration migrateAll) pool
       warp 8080 (App pool)
       
       