|ROTAS                                                          |DESCRIÇÃO                                              |MÉTODOS HTTP       |          
|---------------------------------------------------------------|-------------------------------------------------------|:-----------------:|
|/paciente/#PacienteId                                          |Busca o paciente através do ID.                        |GET                |                                                              
|/paciente/buscar-nome/#Text                                    |Busca o paciente através do nome.                      |GET                |            
|/paciente/listarPacientes                                      |Lista todos os pacientes.                              |GET                |
|/paciente/inserir                                              |Registra um novo paciente.                             |POST               |                                       
|/paciente/alterar/#PacienteId                                  |Altera dados do paciente informando seu ID.            |PUT                |
|/paciente/remover/#PacienteId                                  |Deleta o paciente informando ID.                       |DELETE             |
|/medico/#MedicoId                                              |Busca o médico através do ID.                          |GET                |
|/medico/nome/#Text                                             |Busca o médico por nome.                               |GET                | 
|/medico/listarMedicos                                          |Lista todos os médicos.                                |GET                |
|/medico/inserir                                                |Insere um médico.                                      |POST               |
|/medico/especializacao/#Text                                   |Busca todos os médicos de uma especialidade.           |GET                |
|/medico/alterar/#MedicoId                                      |Altera dados do médico informando seu ID.              |PUT                |   
|/hospital/#HospitalId                                          |Busca o hospital através do ID.                        |GET                |
|/hospital/nome/#Text                                           |Busca o hospital por nome.                             |GET                |
|/hospital/listarHospitais                                      |Lista todos os hospitais.                              |GET                |
|/hospital/inserir                                              |Registra um novo hospital.                             |POST               |
|/hospital/alterar/#HospitalId                                  |Altera dados do hospital informando seu ID.            |PUT                |
|/enfermidade/#EnfermidadeId                                    |Busca enfermidade através do ID.                       |GET                |
|/enfermidade/listarEnfermidades                                |Lista todas as enfermidades.                           |GET                |
|/enfermidade/inserir                                           |Registra uma nova enfermidade.                         |POST               |
|/enfermidade/buscar/#Text                                      |Buscar enfermidade utilizando o nome.                  |GET                |   
|/prontuario/#ProntuarioId                                      |Busca um prontuario através do ID.                     |GET                |   
|/prontuario/listarProntuarios                                  |Lista todos os prontuarios.                            |GET                |   
|/prontuario/inserir                                            |Insere um novo prontuario.                             |POST               |   


## Regras de Negocios

|ROTAS                                                          |DESCRIÇÃO                                              |MÉTODOS HTTP       | 
|---------------------------------------------------------------|-------------------------------------------------------|:-----------------:|
|/medico/hospitais/#MedicoId                                    |Busca todos os hospitais que um médico trabalha.       |GET                |   
|/hospital/buscar-medicos/#HospitalId                           |Buscar todos os médicos que trabalham para um hospital.|GET                |
|/prontuario/buscar-paciente/#PacienteId                        |Buscar todos os prontuarios de um paciente ID.         |GET                |   
|/prontuario/buscar-medico/#MedicoId                            |Buscar todos os prontuarios atendidos por um medico ID.|GET                |   
|/prontuario/buscar-enfermidade/#EnfermidadeId                  |Buscar todos os prontuarios que possuem uma enfermidade|GET                |