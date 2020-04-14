workflow "New workflow" {
  on = "push"
  resolves = ["Deploy to Azure"]
}


action "Deploy to Azure" {
  uses = "./.github/azdeploy"
  secrets = ["SERVICE_PRINCIPAL_PASS"]
  env = {
    SERVICE_PRINCIPAL = "http://jackGitAct",
    TENANT_ID= ${{ secrets.TENANT_ID}},
    APPID= ${{ secrets.APP_ID }}
  }
}
