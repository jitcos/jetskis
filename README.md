# jetskis

## Description

jetskis is a `distrobox`/`toolbx` container made to be used inside of a Fedora Silverblue (or derivative) environment.

## How to use

### Create Box

If you use distrobox:

```bash
distrobox create -i ghcr.io/jitcos/jetskis -n jetskis
distrobox enter jetskis
```

If you use toolbx:

```bash
toolbox create -i ghcr.io/jitcos/jetskis -c jetskis
toolbox enter jetskis
```

## Verification

These images are signed with sisgstore's [cosign](https://docs.sigstore.dev/cosign/overview/). You can verify the signature by downloading the `cosign.pub` key from this repo and running the following command:

    cosign verify --key cosign.pub ghcr.io/jitcos/jetskis

If you're forking this repo you should [read the docs](https://docs.github.com/en/actions/security-guides/encrypted-secrets) on keeping secrets in github. You need to [generate a new keypair](https://docs.sigstore.dev/cosign/overview/) with cosign. The public key can be in your public repo (your users need it to check the signatures), and you can paste the private key in Settings -> Secrets -> Actions.