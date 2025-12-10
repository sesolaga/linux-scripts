sudo pkill openvpn; \
sudo openvpn --config ~/rogo/rogo-info/sergei2.ovpn > /tmp/ovpn.log 2>&1 & \
sleep 12; \
echo "=== Routes ==="; ip route | grep tun0; \
echo "=== Test ==="; ping -c 2 k2 && ssh -o ConnectTimeout=5 k2 echo "SSH WORKS"
