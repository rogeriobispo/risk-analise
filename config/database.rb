set :database, {
  host: ENV.fetch('DB_HOST', nil),
  port: ENV.fetch('DB_PORT', nil),
  adapter: 'postgresql',
  encoding: 'unicode',
  database: "risk-analise-#{ENV.fetch('RACK_ENV', nil)}",
  pool: 2,
  username: ENV.fetch('DB_USER', nil),
  password: ENV.fetch('DB_PWD', nil)
}
