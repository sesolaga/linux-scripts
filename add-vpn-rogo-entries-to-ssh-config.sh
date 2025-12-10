# Add vpn-rogo entry (only if missing)
if ! grep -q "^Host vpn-rogo\b" ~/.ssh/config 2>/dev/null; then
  cat <<'EOF' >> ~/.ssh/config

Host vpn-rogo
  HostName vpn.rogoag.com
  User ubuntu
  IdentityFile ~/Developer/rogo/rogo-info/DefaultLogin.pem
  StrictHostKeyChecking no
EOF
fi

# Add k1–k33 entries
for i in $(seq 1 33); do
  if ! grep -q "^Host k$i\b" ~/.ssh/config 2>/dev/null; then
    cat <<EOF >> ~/.ssh/config

Host k$i
  User rogocompute
  ProxyJump vpn-rogo
  StrictHostKeyChecking no
EOF
  fi
done
