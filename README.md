[![CI Dev](https://github.com/M97Chahboun/flutter_ci_cd/actions/workflows/ci-dev.yaml/badge.svg)](https://github.com/M97Chahboun/flutter_ci_cd/actions/workflows/ci-dev.yaml)
[![Bump app version based on PR labels](https://github.com/M97Chahboun/flutter_ci_cd/actions/workflows/bump-version-based-on-labels.yaml/badge.svg)](https://github.com/M97Chahboun/flutter_ci_cd/actions/workflows/bump-version-based-on-labels.yaml)
[![Deploy Android & Web](https://github.com/M97Chahboun/flutter_ci_cd/actions/workflows/deploy.yaml/badge.svg)](https://github.com/M97Chahboun/flutter_ci_cd/actions/workflows/deploy.yaml)
[![Promote Google Play build from track to another](https://github.com/M97Chahboun/flutter_ci_cd/actions/workflows/promote.yaml/badge.svg)](https://github.com/M97Chahboun/flutter_ci_cd/actions/workflows/promote.yaml)
[![Deploy web & android for testing](https://github.com/M97Chahboun/flutter_ci_cd/actions/workflows/ci-staging.yaml/badge.svg)](https://github.com/M97Chahboun/flutter_ci_cd/actions/workflows/ci-staging.yaml)
[![Deploy web & Promote Android to production](https://github.com/M97Chahboun/flutter_ci_cd/actions/workflows/cd-stable.yaml/badge.svg)](https://github.com/M97Chahboun/flutter_ci_cd/actions/workflows/cd-stable.yaml)

# flutter_ci_cd

CI/CD & Branching template for flutter apps.

## Repo workflow

![alt text](repo_workflow.jpg)


## TODO
- [x] Bump version based on labels when label PR on dev branch
- [x] Create tag based on current version
- [x] Analyze & Test Dev branch PR
- [x] Bump build (Version code) when merge PR on staging branch
- [x] Deploy Android to play store on testing track based on labels (default alpha) 
- [x] Deploy Web for testing
- [ ] Deploy IOS on Testflight for Testing
- [ ] Notify Testers (slack, telegram...)
- [x] Promote Android to production when merge PR on stable branch
- [ ] Promote IOS to production when merge PR on stable branch
- [x] Deploy Web to production when merge PR on stable branch
- [ ] Upload desktop version on release assets (windows, linux & mac)
- [x] Create release & generate release notes based on PR's when merge PR on stable
- [ ] Notify Users (slack, telegram...)
- [x] Manually Workflows for deploy & promote build

