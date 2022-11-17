# run-tdk
Runs free version of [Synthesized TDK](https://docs.synthesized.io/tdk/latest/) as part of GitHub Actions workflows.

## Usage

See [action.yml](action.yml). Notes:
- The runner, either GitHub-hosted or self-hosted, must have access to both input and output databases.
- For transient databases with their life span limited to a single workflow run, it is convenient to
  use [service containers](https://docs.github.com/en/actions/using-containerized-services/about-service-containers).
  For examples of how this can be done, refer to [a test workflow provided in this repository](.github/workflows/run-tdk-test.yml).
  > :point_up: Note that in your workflows you will want to replace the job setting `uses: ./` with `uses: synthesized-io/run-tdk-gha@<version>`

### Masking a database
```yaml
uses: synthesized-io/run-tdk-gha@v1
with:
  input_url: jdbc:yourdb://input-db-host:1234
  input_username: dbuser
  input_password: ${{ secrets.input_db_password }}
  output_url: jdbc:yourdb://output-db-host:8765
  output_username: dbuser
  output_password: ${{ secrets.output_db_password }}
  user_config: |
    default_config:
      mode: MASKING
    schema_creation_mode: DROP_AND_CREATE
```

### Generating a database
```yaml
uses: synthesized-io/run-tdk-gha@v1
with:
  input_url: jdbc:yourdb://input-db-host:1234
  input_username: dbuser
  input_password: ${{ secrets.input_db_password }}
  output_url: jdbc:yourdb://output-db-host:8765
  output_username: dbuser
  output_password: ${{ secrets.output_db_password }}
  user_config: |
    default_config:
      mode: GENERATION
    schema_creation_mode: DROP_AND_CREATE
```
