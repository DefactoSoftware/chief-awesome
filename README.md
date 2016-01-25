# Chief-awesome

## Getting Started

(Assuming you have a machine equipped with Ruby, Postgres, etc.)

After you have cloned this repo, run this setup script to set up your machine
with the necessary dependencies to run and test this app:

    % ./bin/setup

We currently only support Yammer to authenticate. To login on your local
computer go to [Yammer developers docs](https://developer.yammer.com/docs/getting-started) to get started.

Add the `client id` and `client secret` to the `.env` as `YAMMER_KEY` and
`YAMMER_SECRET`

After setting up, you can run the application with rails s. It will launch on
http://localhost:3000, this can be changed in the .env
