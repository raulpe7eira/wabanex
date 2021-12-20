# Wabanex API

This repository is the code corresponding to the [nlw#6 - trilha elixir](https://nextlevelweek.com/) lab.

> The project simulates a Gym Training management API that allows to register trainings and exercises with GraphQL.

## Previous installations

**Database**, we recommends install [PostgreSQL](https://www.postgresql.org/) with [Docker](https://hub.docker.com/_/postgres). After that, sets connection configuration at:

- `config/dev.exs`
- `config/test.exs`

## Gets dependencies, setups database, tests, coverages, reports and starts application

```bash
cd wabanex
mix deps.get
mix ecto.setup
mix test
mix test --cover
mix phx.server
```

## How to use?

```bash
# calculate imc (
#   replaces curly braces:
#     {filename} : file name (e.g.: students.csv)
# )
curl -X GET 'http://localhost:4000/api?filename={filename}'

# provides resources graphql
curl -X POST 'http://localhost:4000/api/graphql'

# provides resources graphql with web development interface
curl -X POST 'http://localhost:4000/api/graphiql'
```

### Resources GraphQL

```bash
# creates user
mutation {
  createUser(input: {
    name: "beltrano",
    email: "beltrano@mail.com",
    password: "123"
  }) {
    id
  }
}

# creates training
mutation {
  createTraining(input: {
    endDate: "2021-12-12",
    startDate: "2021-12-11",
    userId: "b4156e52-79d7-4625-a411-b3535f376d49",
    exercises: [
      {
        name: "Triceps",
        youtubeVideoUrl: "https://youtuba.com/fulano",
        repetitions: "3x15",
        protocolDescription: "drop-set"
      },
      {
        name: "Biceps",
        youtubeVideoUrl: "https://youtuba.com/fulano",
        repetitions: "4x15",
        protocolDescription: "drop-set"
      }
    ]
  }) {
    id
  }
}

# retrieves user
{
  getUser(id: "b4156e52-79d7-4625-a411-b3535f376d49") {
    id
    name
    email
    trainings {
      id
      startDate
      endDate
      exercises {
        id
        name
        youtubeVideoUrl
        repetitions
        protocolDescription
      }
    }
  }
}
```
