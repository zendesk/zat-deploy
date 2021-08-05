<h1 align="center">
  ⚡️ZAT Deploy - Github Action
  <br />
  <img src="https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg">
</h1>

<br />

## 🚀 Description

This Action creates or updates an existing app in your Zendesk instance after a succesful commit in your GitHub repository.

<br />

## 💫 Flow

It requires a .zat file in the root of your repository.

If you want to update an existing app, add an app_id key with the ID of the currently installed app, in ZAT secret.

```JSON
// Sample `.zat` file
{
  "zat_latest": "3.8.0",
  "zat_update_check": "2020-07-01",
  "subdomain": "<subdomain>",
  "username": "<email@example.com>/token",
  "password": "<your_api_token>",
  "app_id": 123456
}
```

<br />

## 🛠 Usage

Below is an example flow to deploy the app to Z3 instance.

```
name: Deploy Zendesk App

on:
  push:
    branches: [develop]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - uses: zendesk/checkout@v2

      - name: Add ZAT Config
        run: |
          echo $ZAT >> .zat
        env:
          ZAT: ${{ secrets.ZAT }}

      - name: ZAT Deploy
        uses: zendesk/zat-deploy@master


```
