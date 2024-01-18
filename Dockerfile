FROM golang:1.18 as builder
WORKDIR /src
COPY . .
RUN go build -o /src/app -ldflags="-w -s" .
FROM gcr.io/distroless/base

LABEL version="1.0.0"
LABEL maintainer="eljke"
LABEL repository="https://github.com/eljke/GitHubTelegramNotifier"
LABEL homepage="https://github.com/eljke/GitHubTelegramNotifier"
LABEL "com.github.actions.name"="GitHub Telegram Notifier"
LABEL "com.github.actions.description"="Notify each git release to Telegram chat"
LABEL "com.github.actions.icon"="bell"
LABEL "com.github.actions.color"="blue"




COPY --from=builder /src/app /
ENTRYPOINT ["/app"]