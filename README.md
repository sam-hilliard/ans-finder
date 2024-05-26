# asn_finder

`asn_finder.sh` is a bash script used to find the Autonomous System Numbers (ASNs) of a given IP, domain, or list of domains. This script leverages DNS resolution and the whois.cymru.com service to retrieve ASNs associated with IP addresses.

## Purpose

The purpose of `asn_finder.sh` is to streamline the process of identifying ASNs for IP addresses and domains during reconnaissance activities. ASNs provide valuable information about the network infrastructure associated with a given IP address or domain, aiding in security assessments and investigations.

## Usage

### Running asn_finder.sh

To use `asn_finder.sh`, provide an IP address, domain, or list of domains as an argument, or pipe the domains directly into the script.

```bash
./asn_finder.sh 8.8.8.8
```

or

```bash
./asn_finder.sh example.com
```

or

```bash
cat domains.txt | ./asn_finder.sh
```

### Example Usage

Suppose `domains.txt` contains the following list of domains:
```
example.com
anotherdomain.com
```

Running `asn_finder.sh` with this file will produce the following output:
```
Domain: example.com
IP Address: [Resolved IP Address]
ASN: [ASN]
-----------------------------------
Domain: anotherdomain.com
IP Address: [Resolved IP Address]
ASN: [ASN]
-----------------------------------
```

### Notes

- The script resolves domains to their IP addresses using DNS resolution.
- ASNs are retrieved using the whois.cymru.com service.
- Ensure that the input file is formatted correctly, with one domain per line.

## License

This project is licensed under the GNU General Public License v3.0. See the [LICENSE](LICENSE) file for details.
