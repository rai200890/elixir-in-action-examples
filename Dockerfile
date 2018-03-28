FROM elixir:1.6.4
ADD . .
CMD mkdir app
WORKDIR app
