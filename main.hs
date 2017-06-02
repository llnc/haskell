import Yesod
import Database.Persist.Postgresql
import Data.Text
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
    infermidadeId InfermidadeId  -- possivel datatype enum
    deriving Show
Infermidade
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
/                                                   HomeR               GET

!/paciente/#PacienteId                              BuscarPacienteR     GET 
/paciente/listarPacientes                           PacienteListarR     GET
/paciente/inserir                                   PacienteInserirR    POST
/paciente/alterar/#PacienteId                       PacienteAlterarR    PATH
/paciente/remover/#PacienteId                       PacienteRemoverR    DELETE


|]

--HANDLERS
getHomeR :: Handler ()
getHomeR = undefined
                                    --handler vai definir qual mimetype 
getBuscarPacienteR :: PacienteId -> Handler Value
getBuscarPacienteR pid = do
    paciente <- runDB $ get404 pid
    sendResponse ( object [pack "resp" .= toJSON paciente ])

getPacienteListarR :: Handler ()
getPacienteListarR = undefined

postPacienteInserirR :: Handler ()
postPacienteInserirR = do
    paciente <- requireJsonBody :: Handler Paciente
    pid <- runDB $ insert paciente
    sendResponse ( object [pack "resp" .= pack "usuario inserido com sucesso" ])
    

pathPacienteAlterarR :: PacienteId -> Handler ()
pathPacienteAlterarR pid = undefined

deletePacienteRemoverR :: PacienteId -> Handler ()
deletePacienteRemoverR pid = undefined


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
       
       