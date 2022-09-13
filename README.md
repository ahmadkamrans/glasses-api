A API based application with JWT Authentication and authorizations using PUNDIT based on user roles and structured through GRAPE.

### Preload Users through seed
```rails db:seed ```

### Start the dev enviroment

```bash
bundle exec rails s
```

### To authorize user :sample
```http://localhost:3000/api/v1/authentications?email=admin@example.com&password=password```

### Pass the token received from above link in every request's header

### To create frames :sample
```http://localhost:3000/api/v1/frames?name=test&description=test&status=active&price=22&currency=USDs&stock=2```

### To create lense
```http://localhost:3000/api/v1/lenses?name=test&description=test&prescription_type=fashion&price=22&currency=USD&stock=2&lense_type=classic```

### To List Frames
```http://localhost:3000/api/v1/frames```

### To List Lense
```http://localhost:3000/api/v1/lenses```

### To Create Glasses

```http://localhost:3000/api/v1/glasses?lense_id=1&frame_id=1&currency=GBP```

### ENV, config, and credential storage

TL;DR

    `rails credentials:edit --environment development`
    `rails credentials:edit --environment production`
    `rails credentials:show --environment development`
    `rails credentials:show --environment production`

### Coding Standards/Practices

Uee Rubocop for standard code practices.

#### Rubocop and Metrics

Run `bundle exec rubocop` before pushing commits to GitHub in order ensure the style
and formatting of the code meets the project's requirements and any reformatting
doesn't introduce new issues.  For example:

```bash
git commit -m "My nice commit Message Here"
bundle exec rubocop
# once it's passing (this is a WIP at the moment)
git push origin master
```

#### Database
Use postgress

### ENV variables
Use .env file for local development
