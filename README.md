# ExponentServerSdk

Use to send push notifications to Exponent Experiences from an Elixir/Phoenix server.

## Installation

ExponentServerSdk is currently able to push single and multiple messages to the Expo Server and retrieve message delivery statuses from a list of IDs.

All HTTPoison Post Request body are automatically GZIP compressed

Add to your dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:exponent_server_sdk, github: "pachun/exponent-server-sdk-elixir"}
  ]
end
```

Then run:

```bash
mix deps.get
```

## Usage

### Notifications

The `ExponentServerSdk.PushNotification` is responsible for sending the messages and hits the latest version of the api.

#### Single Message:

```elixir

# Create a single message map
message = %{
    to: "ExponentPushToken[XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX]",
    title: "Pushed!",
    body: "You got your first message"
  }

# Send it to Expo
{:ok, response} = ExponentServerSdk.PushNotification.push(message)

# Example Response
{:ok, %{"status" => "ok", "id" => "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"}}
```

#### Multiple Messages:

```elixir

# Create a list of message maps (auto chunks list into lists of 100)
message_list = [
  %{
    to: "ExponentPushToken[XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX]",
    title: "Pushed!",
    body: "You got your first message"
  },
  %{
    to: "ExponentPushToken[YYYYYYYY-YYYY-YYYY-YYYY-YYYYYYYYYYYY]",
    title: "Pushed Again!",
    body: "You got your second message"
  }
]

# Send it to Expo
{:ok, response} = ExponentServerSdk.PushNotification.push_list(messages)

# Example Response
{:ok,[ %{"status" => "ok", "id" => "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"}, %{"status" => "ok", "id" => "YYYYYYYY-YYYY-YYYY-YYYY-YYYYYYYYYYYY"} ]}
```

#### Get Messages Delivery Statuses:

```elixir

# Create a list of message ids
ids = ["XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX", "YYYYYYYY-YYYY-YYYY-YYYY-YYYYYYYYYYYY"]

# Send it to Expo
{:ok, response} = ExponentServerSdk.PushNotification.get_receipts(ids)

# Example Response
{:ok,[ %{ "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX": { "status": "ok" }, "YYYYYYYY-YYYY-YYYY-YYYY-YYYYYYYYYYYY": { "status": "ok" } } ]}
```

The complete format of the messages can be found [here.](https://docs.expo.io/versions/latest/guides/push-notifications#message-format)

## Contributing

See the [CONTRIBUTING.md](CONTRIBUTING.md) file for contribution guidelines.

## License

ExponentServerSdk is licensed under the MIT license. For more details, see the `LICENSE`
file at the root of the repository. It depends on Elixir, which is under the
Apache 2 license.

## Acknowledgements

This project was originally created and maintained by [rdrop](https://github.com/rdrop). The current maintainer is grateful for their foundational work on this library.

### Inspiration

[ex_twilio](https://github.com/danielberkompas/ex_twilio)

[hex]: http://hex.pm
