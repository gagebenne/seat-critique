# Seat Critique

Seat Critique is an all-in-one restroom app which lets users find and critique restrooms near them.

### Team Members

[Gage Benne](https://github.com/gagebenne)<br>
[Zachary Bruennig](https://github.com/zbruennig)<br>
[Andy Monroe](https://github.com/andrew-monroe)<br>
[Mason Wilde](https://github.com/masonwilde)

### Prerequisites

Seat Critique was built with Ruby 2.4.1, Rails 5.1.4, Postgres 9.6.5, and Docker 17.09.0-ce.<br>
To set up Rails with Postgres, follow [this guide](https://www.digitalocean.com/community/tutorials/how-to-setup-ruby-on-rails-with-postgres).<br>
To set up Docker with Rails, follow [this guide](https://docs.docker.com/compose/rails/)

### Configuration

Once your Rails environment is set up, clone this repository by typing `git clone https://github.com/GitGud-KU/seat-critique.git` into your terminal.<br>

Then, add your database settings into the config/database.yml file.

Be sure that Docker is running then run '`docker-compose build` to build the project.  

Next, to setup the database: `docker-compose run web rake db:create`.

Finally, run `rake db:create`, `rake db:seed`, then `rake db:migrate`, all with `docker-compose run web` preceeding the command. Alternatively, try running `rake db:fix`, which should run all three of them at once.

With the database set up, docker running, Seat Critique should be ready to run! Type `docker-compose up` to launch the app.  Also, try running the application detached `docker-compose up -d` to avoid server.pid issues.

### Works Cited/Libraries Used:

[Rails](http://rubyonrails.org/)<br>
[Bootstrap](http://getbootstrap.com/)<br>
[Bootswatch](https://bootswatch.com/)<br>
[Devise](https://github.com/plataformatec/devise)<br>
[Simple Form](https://github.com/plataformatec/simple_form)<br>
[Simple Form Star Styling](https://codepen.io/lsirivong/pen/ekBxI)<br>
[Gmaps4rails](https://apneadiving.github.io/)<br>
[Gemfile Gems](https://github.com/GitGud-KU/seat-critique/blob/master/Gemfile)<br>

### Testing

All of our tests are located within the **test** folder.<br>
Our tests can be run through terminal. Within the project directory, run<br>
`docker-compose run web rake test`.<br>
Successful tests will show up as green dots, while failed tests show up as a red F with the error message underneath it.

### [Bug List](documentation/buglist.md)
