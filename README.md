## Rotas

<table>
<tr>
<th><sub>ROTA</sub></th>
<th><sub>DESCRIÇÃO</sub></th> 
 
</tr>
<tr>
<td><strong><sub>/</sub></strong></td>
<td><sub>Contêm informações sobre o sistema, links de acesso, um resumo e cidades disponíveis.</sub></td>

</tr>

<tr>
<td><strong><sub>/paciente/{CodigoPaciente}</sub></strong></td>
<td><sub>Buscar paciente pelo ID.</sub></td>

</tr>
<tr>
<td><strong><sub>/paciente/buscar-nome</sub></strong></td>
<td><sub>Buscar paciente através do nome.</sub></td>

</tr>
<tr>
<td><strong><sub>/paciente/listarPacientes</sub></strong></td>
<td><sub>Listar todos os pacientes.</sub></td>

</tr>    
<tr>
<td><strong><sub>/paciente/inserir</sub></strong></td>
<td><sub>Para cadastro de novo paciente.</sub></td>

</tr>        
<tr>
<td><strong><sub>/paciente/alterar/{CodigoPaciente}</sub></strong></td>
<td><sub>Alterar informações do paciente através do ID.</sub></td>

</tr>
<tr>
<td><strong><sub>/paciente/remover/{CodigoPaciente}</sub></strong></td>
<td><sub>Remover paciente através do ID.</sub></td>

</tr>


<tr>
<td><strong><sub>/medico/{CodigoMedico}</sub></strong></td>
<td><sub>Buscar medico pelo ID.</sub></td>

</tr>
<tr>
<td><strong><sub>/medico/nome</sub></strong></td>
<td><sub>Buscar medico através do nome.</sub></td>

</tr>
<tr>
<td><strong><sub>/medico/listarMedicos</sub></strong></td>
<td><sub>Listar todos os medicos cadastrados.</sub></td>

</tr>    
<tr>
<td><strong><sub>/medico/inserir</sub></strong></td>
<td><sub>Para cadastro de novo medico.</sub></td>

</tr>        
<tr>
<td><strong><sub>/medico/alterar/{CodigoMedico}</sub></strong></td>
<td><sub>Alterar informações do medico através do ID.</sub></td>

</tr>
<tr>
<td><strong><sub>/medico/especializacao</sub></strong></td>
<td><sub>Buscar todos os médicos de uma determinada especialidade.</sub></td>

</tr>

<tr>
<td><strong><sub>/medico/hospitais/{CodigoMedico}</sub></strong></td>
<td><sub>Buscar todos os hospitais que determinado medico trabalha.</sub></td>

</tr>


<tr>
<td><strong><sub>/hospital/{CodigoHospital}</sub></strong></td>
<td><sub>Buscar hospital pelo ID.</sub></td>

</tr>
<tr>
<td><strong><sub>/hospital/nome/</sub></strong></td>
<td><sub>Buscar hospital através do nome.</sub></td>

</tr>
<tr>
<td><strong><sub>/hospital/listarHospitais</sub></strong></td>
<td><sub>Listar todos os hospitais cadastrados.</sub></td>

</tr>    
<tr>
<td><strong><sub>/hospital/inserir</sub></strong></td>
<td><sub>Para cadastro de novo hospital.</sub></td>

</tr>        
<tr>
<td><strong><sub>/hospital/alterar/{CodigoHospital}</sub></strong></td>
<td><sub>Alterar informações do hospital através do ID.</sub></td>

</tr>
<tr>
<td><strong><sub>/hospital/buscar-medico/{CodigoHospital}</sub></strong></td>
<td><sub>Buscar todos os medicos que trabalham em um determinado hospital</sub></td>

</tr>


<tr>
<td><strong><sub>/enfermidade/{CodigoEnfermidade}</sub></strong></td>
<td><sub>Buscar enfermidade pelo ID.</sub></td>

</tr>
<tr>
<td><strong><sub>/enfermidade/listarEnfermidades</sub></strong></td>
<td><sub>Listar todas as enfermidades.</sub></td>

</tr>
<tr>
<td><strong><sub>/enfermidade/inserir</sub></strong></td>
<td><sub>Para cadastro de uma nova enfermidade.</sub></td>

</tr>    

<tr>
<td><strong><sub>/enfermidade/buscar/</sub></strong></td>
<td><sub>Buscar enfermidade através do nome</sub></td>

</tr>


<tr>
<td><strong><sub>/prontuario/{CodigoProntuario}</sub></strong></td>
<td><sub>Buscar prontuario pelo ID.</sub></td>

</tr>
<tr>
<td><strong><sub>/prontuario/listarProntuarios</sub></strong></td>
<td><sub>Listar todos os prontuarios cadastrados.</sub></td>

</tr>

<tr>
<td><strong><sub>/prontuario/inserir</sub></strong></td>
<td><sub>Para cadastro de um novo prontuario.</sub></td>

</tr>        
<tr>
<td><strong><sub/prontuario/buscar-paciente/{CodigoPaciente}</sub></strong></td>
<td><sub>Buscar todos os prontuarios de um determinado paciente através do ID.</sub></td>

</tr>
<tr>
<td><strong><sub/prontuario/buscar-medico/{CodigoMedico}</sub></strong></td>
<td><sub>Buscar todos os prontuarios de um determinado medico através do ID.</sub></td>

</tr>
<tr>
<td><strong><sub/prontuario/buscar-enfermidade/{CodigoEnfermidade}</sub></strong></td>
<td><sub>Buscar todos os prontuarios que possuem uma determinada enfermidade através do ID.</sub></td>

</tr>


</table>