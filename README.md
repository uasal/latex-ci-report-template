
# LaTeX Documentation Respository

Latest **[Compiled PDF](https://github.com/uasal/latex-ci-report-template/raw/compiled/instrument_guide.pdf)**

Compile log and status of the main branch:
[![GitHubActionBadge](https://github.com/uasal/latex-ci-report-template/actions/workflows/compile.yml/badge.svg?branch=main)](https://github.com/uasal/latex-ci-report-template/actions)


Unlike Pages, the output is moved to a branch called `compiled` which does not track the main branch but retains all the permissions of the rest of the repository.

```
git checkout --orphan compiled 
git branch --track compiled origin/compiled
git reset --hard   
git commit --allow-empty -m "Init" 
git push origin compiled
```
