# Seat Critique

Seat Critique is an all-in-one restroom app which lets users find and critique restrooms near them.

### Team Members

[Gage Benne](https://github.com/gagebenne) 

[Zachary Bruennig](https://github.com/zbruennig)

[Andy Monroe](https://github.com/andrew-monroe)

[Mason Wilde](https://github.com/masonwilde)

### Prerequisites

Seat Critique was built with Ruby 2.4.1, Rails 5.1.4, Postgres 9.6.5, and Docker 17.09.0-ce.

To set up Rails with Postgres, follow [this guide](https://www.digitalocean.com/community/tutorials/how-to-setup-ruby-on-rails-with-postgres).

To set up Docker with Rails, follow [this guide](https://docs.docker.com/compose/rails/)

### Configuration

Once your Rails environment is set up, run `git clone https://github.com/GitGud-KU/seat-critique.git`

Then, add your database settings into the config/database.yml file.

Be sure that Docker is running then run '`docker-compose build` to build the project.  

Next, to setup the database: `docker-compose run web rake db:create`.

Finally, run `rake db:create` then `rake db:migrate`, all with `docker-compose run web` preceeding the command.

With the databse set up, docker running, Seat Critique should be ready to run! Type `docker-compose up` to launch the app.  Also, try running the application detached `docker-compose up -d` to avoid server.pid issues.

### Works Cited/Libraries Used:

[Rails](http://rubyonrails.org/)

[Bootstrap](http://getbootstrap.com/)

[Bootswatch](https://bootswatch.com/)

[Gemfile Gems](https://github.com/GitGud-KU/Skeddit/blob/master/Gemfile)

[Devise](https://github.com/plataformatec/devise)

[Simple Form](https://github.com/plataformatec/simple_form)
