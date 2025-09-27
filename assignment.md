# Security Protocols and their Formal Analysis
## Case Studies and Formal Models with ProVerif and Tamarin

### Abstract
This document revisits classical security protocol design and applies modern formal verification techniques to the TLS 1.3 core handshake. It compares historical protocol notation with modern symbolic and computational models, applies structured threat modeling to medical, financial, and defense case studies, and provides runnable ProVerif and Tamarin models in the appendix.

## 1. Introduction
Security principles (confidentiality, integrity, availability, authenticity) remain central to software engineering. This assignment updates the SPR material to 2025: TLS 1.3, zero trust, privacy-preserving computation, and formal verification methods.

## 2. Secure Communication Protocols
[Figure 2.1: Simplified TLS 1.3 Handshake Flow shown here]

*Inline ProVerif equation example:*

```
equation dh(exp(g(), x), y) = dh(exp(g(), y), x).
```

*Inline Tamarin lemma example:*

```
lemma forward_secrecy:
  "All C S k sid sk #i #j #u.
     (AppKey(C,S,k,sid)@i
      & UsesLtk(sk,sid)@u
      & LtkRev(sk)@j
      & i < j)
     ==> not (K(k))"
```

(Full formal models are provided in Appendix A.)

## 3. Containment vs Publisher Trust
Containment (sandboxing) and publisher trust (signing) represent two paradigms for running untrusted code. The modern approach is layered: sign provenance, runtime sandbox, continuous monitoring.

## 4. Case Studies in Secure Data Systems
### 4.1 Medical Databases
Threats: insider misuse, ransomware, cloud misconfigurations. Controls: RBAC, encryption, differential privacy.
### 4.2 Financial Data Systems
Threats: payment fraud, high-frequency exploitation, crypto theft. Controls: MFA, HSMs, anomaly detection.
### 4.3 Government / Military Systems
Threats: nation-state APTs, supply-chain backdoors, strategic sabotage. Controls: air-gaps, compartmentalisation, PQC adoption.

## 5. Discussion and Future Directions
Zero Trust, post-quantum transition, AI governance, and privacy-preserving analytics will shape the next decade of secure systems.

## 6. Conclusion
Reiterates enduring principles and calls for socio-technical designs that are usable, governable, and resilient.

## Appendix A: Formal Models of TLS 1.3
See files `tls13_strict.pv` and `TLS13_Strict.spthy` included in the package. Sample attack trace image also included as Figure A.1.