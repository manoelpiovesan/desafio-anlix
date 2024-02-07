# Desafio - Anlix

### ⏱️ TODO (Backend)


  características existentes de todos os pacientes da base de dados;
- [ ] Consultar uma característica qualquer de um paciente para um intervalo de
  datas a ser especificado na chamada da API;
- [ ] Consultar o valor mais recente de uma característica de um paciente que
  esteja entre um intervalo de valores a ser especificado na chamada da API;

### ✅ DONE (Backend)
- [x] Consultar para uma determinada data (dia, mês e ano), todas as com os valores mais recentes de cada uma;
```bash
$ curl localhost:8080/pacientes/indices?date=yyyy-MM-dd
```
<br>
- [x] Consultar em uma única chamada, todas as características de um paciente,
```bash
$ curl localhost:8080/pacientes/{id}/indices
```
<br>
- [x] Consultar, para cada paciente, cada uma das características
  individualmente e cada uma delas sendo a mais recente disponível;

```bash
$ curl localhost:8080/pacientes/{id}/pulmonar
```
```bash
$ curl localhost:8080/pacientes/{id}/cardiaco
```
<br>
- [x] Consultar pacientes que contenham um nome ou parte de um nome a ser
  especificado na chamada da API.

```bash
$ curl localhost:8080/pacientes?t=termoDePesquisa
```

