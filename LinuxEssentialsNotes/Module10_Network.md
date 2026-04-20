# Module 10: Networking Fundamentals and Troubleshooting

This module covers the core concepts of networking, IP addressing, and the essential tools for diagnosing connection issues in a Linux environment.

## 1. Core Networking Terminology
Understanding how devices communicate is the foundation of system administration.

* **DNS (Domain Name System):** A global network of servers that translates human-readable hostnames (e.g., www.google.com) into IP addresses.
* **DHCP (Dynamic Host Configuration Protocol):** A server protocol that automatically assigns IP addresses and network configurations to devices.
* **Ethernet:** A wired connection using cables plugged into specific ports on a PC or server.
* **IP Address:** A unique numerical identifier for a device on a network (IPv4 or IPv6).
* **Netmask (Subnet Mask):** Used to distinguish between the network portion and the host (machine) portion of an IP address.
    * *Example:* IP `192.168.1.11` with Subnet `255.255.255.0`.
* **Router:** A device that connects two or more networks and acts as a **Gateway**.
* **Gateway:** The IP address of the router that connects a local network to the Internet.
* **TCP/IP:** The standard suite of protocols that underlie modern networking.

---

## 2. IP Configuration: Static vs. Dynamic
A DHCP server can deliver IP addresses in two ways:
1. **Fixed (Static):** Giving the same specific IP address to a specific machine. Crucial for servers.
2. **Dynamic:** Assigning different available IPs to machines as they connect.

---

## 3. CLI Tools for Network Configuration
While GUIs are easier for Wi-Fi, the Command Line Interface (CLI) is standard for server management.

### Wireless Tools:
* `iwlist`: Identifies available Wi-Fi connections.
* `iwconfig`: Used to connect or disconnect from wireless networks.

### Ethernet & General Tools:
* `ifconfig`: Traditional tool to view/configure network interfaces (legacy).
* `ip addr show`: The modern command to view IP addresses and adapters.
    * **Loopback (127.0.0.1):** The internal address of the machine itself.
* `ip link set <device> up/down`: Used to activate or deactivate a specific network connection.
* `/etc/resolv.conf`: A configuration file containing the IP addresses of DNS nameservers.

---

## 4. Network Testing and Troubleshooting
Effective troubleshooting follows a logical path to locate where the problem exists.

* **Ping:** Sends a simple network packet to a specific IP and waits for a reply.
    * *Linux behavior:* Continues until interrupted (`Ctrl + C`).
    * *Windows behavior:* Stops after 4 packets.
* **Traceroute:** Sends a series of packets to show every "hop" (router) between your system and the target. Invaluable for finding where a connection is blocked.
* **Netstat:** Shows active network connections, ports in use, and their status.
    * Use `-l` or `-p` options for detailed server port info.
* **Host / Dig / Nslookup:** Tools used to test DNS resolution (Phonebook lookup).

### Troubleshooting Logic:
1. **If you can ping inside but not outside:** Likely a **Router/Gateway** problem.
2. **If you can ping an IP but not a Name:** It is a **DNS** problem.
3. **If you cannot ping at all:** Likely a **Configuration** or physical hardware problem.

---

## 5. Network Protection and Security Tips
1. **Shut down unused services:** Avoid leaving open "doors" for hacking attacks.
2. **Enable a Firewall:** Acts as a "police officer" checking all incoming/outgoing traffic and ports.
3. **Use strong passwords.**
4. **Be suspicious:** Monitor unusual traffic patterns.
5. **Keep software up to date:** Ensure security patches are applied.

---
