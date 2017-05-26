import Yesod
import Database.Persist.Postgresql
import Data.Text
import Control.Monad.Logger (runStdoutLoggingT)


             
data App = App{connPool :: ConnectionPool}

instance Yesod App 

share [mkPersist sqlSettings, mkMigrate "migrateAll"] [persistLowerCase|

Paciente 
    nome Text
    idade Int
    cpf Text
   deriving Show
  

   
Prontuario
    pacienteId PacienteId
    dat Text
    deriving Show
    
Hospital
    nome Text
    cnpj Text
    deriving Show
    
Atendimento
    pacienteId PacienteId
    hospitalId HospitalId
    deriving Show
|]


mkYesod "App" [parseRoutes|
/ HomeR GET

|]

getHomeR :: Handler ()
getHomeR = undefined


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
       
       