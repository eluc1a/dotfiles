# DELUGE

## -

### If traffic is not being sent or received with VPN

#### Symptoms

- Deluge is not sending any traffic
- Deluge is not receiving any traffic
- There is an error in the tracker
- Not connecting to seeds or peers

#### Solution

1. **Locate Deluge’s config file**  
   - Directory: `~/.config/deluge/`  
   - File: `~/.config/deluge/core.conf`

2. **Discover your PIA WireGuard IP**  
   Run in your terminal:  

       ip -4 addr show | grep wgpia0

   Note the `inet` address (e.g. `10.38.231.115`).

3. **Bind Deluge to the VPN IP**  
   Open the Deluge config:  

       vim ~/.config/deluge/core.conf

   Inside the top‑level JSON object, add or update:  

       "listen_interface": "10.38.231.115",
       "listen_ports": [43986, 43986],
    The **listen interface** is the equivalent of this section in the UI:
    `Preferences -> Network -> Incoming Address`
    The port is determined by the PIA port forward.

4. **Clear any outgoing‑interface override**  
   In Deluge UI → **Preferences → Network**, clear the **Outgoing Interface** field so it defaults to your VPN.

5. **Restart Deluge under your user**  
   In your terminal:  

       pkill deluged
       deluged -d

6. **Refresh PIA port‑forward** (expires hourly)  
   In your terminal:  

       piastatus | grep portforward

   Confirm it shows `portforward: 43986`.

7. **Verify Deluge is listening on the VPN IP**  
   In your terminal:  

       sudo ss -tunlp | grep 43986

   You should see `10.38.231.115:43986` bound by `deluged`.

8. **Test external reachability**  
   From another machine:  

       nc -vz <PIA_PUBLIC_IP> 43986

   Replace `<PIA_PUBLIC_IP>` with the `pubip` from `piastatus`; it should succeed.

9. **Confirm tracker connectivity**  
   In Deluge → select a torrent → **Trackers** tab:  
   - **Status** = OK  
   - Peers listed  
   Keep **DHT** and **Peer Exchange** disabled - enable everything else. 