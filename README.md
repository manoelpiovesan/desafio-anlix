# Desafio Anlix
[![Typing SVG](https://readme-typing-svg.demolab.com?font=Fira+Code&size=18&duration=2000&pause=500&color=23C815&random=false&width=800&lines=localhost%3A8080%2Fpacientes%2F%7Bid%7D%2Fpulmonar;localhost%3A8080%2Fpacientes%2F%7Bid%7D%2Fpulmonar%3Fstart%3Dyyyy-MM-dd%26end%3Dyyyy-MM-dd;localhost%3A8080%2Fpacientes%2F%7Bid%7D%2Fpulmonar%3Fmin%3DvalorMinimo%26max%3DvalorMaximo+;localhost%3A8080%2Fpacientes%2Fpulmonar%2Fcsv;localhost%3A8080%2Fpacientes%2F%7Bid%7D%2Fpulmonar%2Fcsv%3Fdownload%3Dtrue)](https://git.io/typing-svg)
### ⏱️ TODO 

---

- [ ] Implementar testes;




### ✅ DONE 

---

- [x] Endpoint de .csv dos dados

```bash
$ curl localhost:8080/pacientes/pulmonar/csv
```
```bash
$ curl localhost:8080/pacientes/cardiaco/csv
```
```bash
$ curl localhost:8080/pacientes/{id}/pulmonar/csv?download=true
```
```bash
$ curl localhost:8080/pacientes/{id}/cardiaco/csv?download=true
```
> O parâmetro `download` é opcional e pode ser `true` ou `false`.
> Se `true`, o arquivo será baixado. Por padrão, é `false`.

- [x] Consultar o valor mais recente de uma característica de um paciente que
  esteja entre um intervalo de valores a ser especificado na chamada da API;
```bash
$ curl localhost:8080/pacientes/{id}/pulmonar?min=valorMinimo&max=valorMaximo 
```
```bash
$ curl localhost:8080/pacientes/{id}/cardiaco?min=valorMinimo&max=valorMaximo
```

- [x] Consultar uma característica qualquer de um paciente para um intervalo de
  datas a ser especificado na chamada da API;
```bash
$ curl localhost:8080/pacientes/{id}/pulmonar?start=yyyy-MM-dd&end=yyyy-MM-dd
```
```bash
$ curl localhost:8080/pacientes/{id}/cardiaco?start=yyyy-MM-dd&end=yyyy-MM-dd
```
<br>

- [x] Consultar para uma determinada data (dia, mês e ano), todas as com os valores mais recentes de cada uma;
```bash
$ curl localhost:8080/pacientes/indices?date=yyyy-MM-dd
```

<br>

- [x] Consultar em uma única chamada, todas as características de um paciente, cada uma delas sendo a mais recente disponível;
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

