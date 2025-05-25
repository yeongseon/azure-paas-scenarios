#!/bin/bash
set -euo pipefail

SCENARIO_DIR="$1"

if [[ -z "$SCENARIO_DIR" ]]; then
  echo "❌ Usage: $0 <path_to_scenario>"
  exit 1
fi

SCENARIO_YAML="$SCENARIO_DIR/scenario.yaml"
APP_DIR="$SCENARIO_DIR/app"
ZIP_PATH="$SCENARIO_DIR/app.zip"
TF_DIR="$SCENARIO_DIR/terraform"

if [[ ! -f "$SCENARIO_YAML" ]]; then
  echo "❌ scenario.yaml not found in $SCENARIO_DIR"
  exit 1
fi

# yq 필수 확인
if ! command -v yq &> /dev/null; then
  echo "❌ 'yq' not found. Install it from https://github.com/mikefarah/yq"
  exit 1
fi

PAASTYPE=$(yq e '.paas' "$SCENARIO_YAML")
OS=$(yq e '.os' "$SCENARIO_YAML")
NAME=$(yq e '.name' "$SCENARIO_YAML")

echo "🚀 Deploying scenario: $NAME"
echo "📦 PaaS Type: $PAASTYPE | 🖥️ OS: $OS"

# 1. Terraform apply
echo "🔧 Running Terraform..."
cd "$TF_DIR"
terraform init -input=false
terraform apply -auto-approve

APP_NAME=$(terraform output -raw app_name)
RESOURCE_GROUP=$(terraform output -raw resource_group_name)
APP_URL=$(terraform output -raw app_url)

# 2. Package app
echo "📦 Creating zip from $APP_DIR..."
cd "$SCENARIO_DIR"
zip -r -q app.zip app

# 3. Deploy by paas type
if [[ "$PAASTYPE" == "webapp" ]]; then
  echo "🚀 Deploying zip to Azure Web App..."
  az webapp deploy \
    --resource-group "$RESOURCE_GROUP" \
    --name "$APP_NAME" \
    --src-path "$ZIP_PATH" \
    --type zip
else
  echo "❌ Unsupported PaaS type: $PAASTYPE"
  exit 1
fi

echo "✅ Deployed successfully!"
echo "🌐 URL: $APP_URL"
