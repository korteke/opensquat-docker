openSquat
====
![alt text](https://raw.githubusercontent.com/atenreiro/opensquat/master/screenshots/openSquat_logo.png)

What is openSquat
-------------

openSquat is an opensource Intelligence (OSINT) security tool to identify **cyber squatting** threats to specific companies or domains, such as:

*   Phishing campaigns
*   Domain squatting
*   Typo squatting
*   Bitsquatting
*   IDN homograph attacks
*   Doppenganger domains
*   Other brand/domain related scams

It does support some key features such as:

*   Automatic newly registered domain updating (once a day)
*   Levenshtein distance to calculate word similarity
*   Fetches active and known phishing domains (Phishing Database project)
*   IDN homograph attack detection
*   Integration with VirusTotal
*   Integration with Quad9 DNS service
*   Use different levels of confidence threshold to fine tune
*   Save output into different formats (txt, JSON and CSV)
*   Can be integrated with other threat intelligence tools and DNS sinkholes

As an opensource project, everyone's welcome to contribute.

# Dockerized OpenSquat
This is a dockerized version [openSquat](https://github.com/atenreiro/opensquat)

## Basic usage
Modify the config/keywords.txt file according to your needs.
```bash
docker run --rm -v "$(pwd)"/config:/app/config korteke/opensquat -k /app/config/keywords.txt
```

## Usage exmaples from openSquat
```bash
    # for all the options
    docker run --rm -v "$(pwd)"/config:/app/config korteke/opensquat -h
    
    # With DNS validation (quad9)
    docker run --rm -v "$(pwd)"/config:/app/config korteke/opensquat -k /app/config/keywords.txt --dns
    
    # Subdomain search
    docker run --rm -v "$(pwd)"/config:/app/config korteke/opensquat -k /app/config/keywords.txt --subdomains
    
    # Check for domains with open ports 80/443
    docker run --rm -v "$(pwd)"/config:/app/config korteke/opensquat -k /app/config/keywords.txt --portcheck

    # With Phishing validation (Phishing Database)
    docker run --rm -v "$(pwd)"/config:/app/config korteke/opensquat -k /app/config/keywords.txt --phishing /app/config/phish_results.txt

    # Save output as JSON
    docker run --rm -v "$(pwd)"/config:/app/config korteke/opensquat -k /app/config/keywords.txt -o /app/config/output.json -t json

    # Save output as CSV
    docker run --rm -v "$(pwd)"/config:/app/config korteke/opensquat -k /app/config/keywords.txt -o /app/config/output.csv -t csv

    # Conduct a certificate transparency (ct) hunt
    docker run --rm -v "$(pwd)"/config:/app/config korteke/opensquat -k /app/config/keywords.txt --ct

    # Period search - registrations from the last month (default: day)
    docker run --rm -v "$(pwd)"/config:/app/config korteke/opensquat -k /app/config/keywords.txt -p month

    # Tweak confidence level. The lower values bring more false positives
    # (0: very high, 1: high (default), 2: medium, 3: low, 4: very low
    docker run --rm -v "$(pwd)"/config:/app/config korteke/opensquat -k /app/config/keywords.txt -c 2

    # All validations options
    docker run --rm -v "$(pwd)"/config:/app/config korteke/opensquat -k /app/config/keywords.txt --phishing /app/config/phishing_domains.txt --dns --ct --subdomains --portcheck

```

