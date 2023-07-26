set :database, {
    host: ENV['DB_HOST'],
    port: ENV['DB_PORT'], 
    adapter: 'postgresql',  
    encoding: 'unicode', 
    database: "risk-analise-#{ENV['RACK_ENV']}", 
    pool: 2, 
    username: ENV['DB_USER'], 
    password: ENV['DB_PWD']
  }