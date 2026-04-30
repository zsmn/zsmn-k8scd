#!/bin/sh
set -e

mkdir -p /git/zsmn-k8scd.git
cd /git/zsmn-k8scd.git
git init --bare
git config http.receivepack true
git config http.getanyfile true

cd /git
git clone zsmn-k8scd.git /tmp/work
cd /tmp/work

cp -r /manifests/* .
git add -A
git config user.email "argocd@local"
git config user.name "ArgoCD Local"
git commit -m "Initial commit" || true
git push origin main || true

cd /git/zsmn-k8scd.git
git update-server-info

echo "Repository ready at /git/zsmn-k8scd.git"

exec lighttpd -D -f /etc/lighttpd/lighttpd.conf