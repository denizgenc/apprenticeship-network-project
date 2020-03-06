Cyber Apprentice network project Terraform repo
==========
This houses the terraform (and potentially other files) that will relate to my Cyber networking
project.


# Installation
Before you do anything, you have to create an S3 bucket (preferably with versioning) and reference
it in the `backend.tf` file, for both the terraform backend resource and the
`terraform_remote_state` data source.

You have to do this because I couldn't figure out how to create a remote state and create a 
reference to it in the backend configuration at the same time.

---------

## General Plan
In this project, I shall be creating a network infrastructure to host a Wordpress site. This may
involve an EC2 and an RDS instance, along with accompanying infrastructure (VPCs, route tables,
security groups, etc).

The architecture should be defined as infrastructure-as-code (in this case, via Terraform), and the
deployment should be scripted so that it can be replicated down the line by others.

The version of Wordpress that I will be tasked to use will not necessarily be the latest one. It
will be my responsibility to research the vulnerabilities present in the version, and find a way
to mitigate them without needing to patch the Wordpress version.
- The reason for this is that there can be various plug-ins etc that have a dependency on an
  outdated version of Wordpress, etc. This may not necessarily be for my installation of Wordpress,
  but it is still useful to simulate this constraint, as it can be common in real-world scenarios.

In summary, this project should follow the iterative process below:
- Set up the network that will host the WP site.
- Research into how the current version of Wordpress is vulnerable
- Then, for each vulnerability found:
  - Demonstrate the vulnerability, by exploiting it. Document this.
  - Research how to mitigate the vulnerability.
  - Implement the mitigation, and demonstrate that you can no longer exploit the vulnerability.
    Document this.

## Requirements

From the checklist provided to apprentices:

### Design, build, test and troubleshoot a network incorporating:

- more than one subnet with static and dynamic routes
- that includes servers, hubs, switches, routers and user devices
    - eg: (Ping, IPconfig, IPsec, Traceroute, RIPv2)
    - eg; dynamic routing protocol - OSPF, ISIS, EIGRP, BGP, RIP SNMP, EGP, RIPng,
    - eg, static, manually administered-single network communicating with 1 or 1 other networks,
      connect to specific network, provide Gateway of last Resort, reduce number of routes, back route.
    - eg: (security authentication-) WPA2PSK AES encryption-SSH

to a given design requirement without supervision

Using standard procedures and tools, carries out defined tasks associated with the planning,
installation, upgrade, operation, control and maintenance of local and wide area networks for
communication of any type of digital data, within one or more computer systems.

### Provide evidence that the system meets the design requirement.

Produces outline system designs and specifications covering objectives:

- scope,
- features,
- facilities,
- management,
- reliability,
- resilience,
- security,
- constraints (such as performance, resources and cost),
- hardware,
- network and software environments,
- main system functions and information flows,
- traffic volumes,
- data load and implementation strategies,
- phasing of development,
- requirements not met,
- and alternatives considered.

### Design and build a simple system in accordance with a simple security case.
Provide evidence that the system has properly implemented the security controls required by the
security case. The system could be either at the enterprise, network or application layer.

Working alone on simple systems or with colleagues on more complex systems, produces outline system
specifications covering for example: objectives, scope, constraints (such as performance, resources
etc.), hardware, network and software environments, main system functions and information flows,
data load and implementation strategies, phasing of development, requirements not met, and
alternatives considered.

### Select and configure at least 2  types of common security hardware and software components to implement a given security policy.
E.g. Hardware: firewalls, proxy servers, hardware security modules(HSM) for cryptographic
keys-encryption & authentication system, physical protection, IPsec, AES, Edge router Kerberos.
E.g. software: Barracuda, Kaspersky; spyware removal programs,  antivirus software, firewall
software, Aircrack, Bitlocker

Installs or removes hardware and/or software, using supplied installation instructions and tools;
follows agreed standards, including those for electrical work.

Agrees the timing of the work with those affected, e.g. users, operations management, including,
where appropriate, hand-over to client.

### Design a system employing a crypto to meet defined security objectives.
What type of crypto: for what reason?  for example:

- Algorithms
- Certificates
- protocol, IPsec
- VPN
- WEP/ WPA

Develop and implement a key management plan for the given scenario/system.

- the 4 phases in lifecycle- KMP follows the management practices in the company.

Applies and maintains specific procedures and security controls as required by organisational policy
and local risk assessments to maintain confidentiality, integrity and availability of business
information systems and infrastructure components.

For all services and systems within IT security management, maintains auditable records and user documentation.

For example, assists in the preparation and maintenance of evidence required for internal and
external audit purposes, and for business recovery plans, particularly in the data collection and
compilation/production/distribution phases of the exercise.
