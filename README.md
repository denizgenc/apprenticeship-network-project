Cyber Apprentice network project Terraform repo
==========
This houses the terraform (and potentially other files) that will relate to my Cyber networking
project.

## General Plan
We need to be able to test our detection capabilities for misconfigurations in AWS and security
weaknesses in our applications and their dependencies.

We want a ring-fenced AWS infrastructure containing a number of security and reliability precautions
and protections which can be terraformed into a number of states; a healthy state plus a number of
weakened states. This will allow us to test our detection capabilities are operating as intended.

We should be able to run the terraform with different var files or from different branches to create
different states. Var files is probably preferable since it would be difficult to maintain
consistency across multiple branches.

The goal is to build this iteratively in an agile manner so as we complete each iteration we’ll
validate and then add the next requirement. This doc should be maintained to capture all the
requirements completed and those identified for future iterations.

Requirements will be specified as a problem to be solved without a proposed solution. It will be up
to Deniz to identify and implement a suitable mitigation for the given problem.

## Requirements

From the checklist provided to apprentices:

### Design, build, test and troubleshoot a network incorporating:

- more than one subnet with static and dynamic routes
- that includes servers, hubs, switches, routers and user devices
    - eg: (Ping, IPconfig, IPsec, Traceroute, RIPv2)
    - eg; dynamic routing protocol - OSPF, ISIS, EIGRP, BGP, RIP SNMP, EGP, RIPng,
    - eg, static, manually administered-single network communicating with 1 or 1 other networks, connect to specific nework, provide Gateway of last Resort, reduce number of reoutes, back route.
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
