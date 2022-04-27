### Steps for git

1. Follow these steps for adding your code to git: 

```bash 
git init 

```

2. Add the code 
```
git add . 

```

3. Set your git config(do this only one time.)
``` 
git config --global user.name your-github-user-name 

git config --global user.email your-github-email
```

4. Commit  your code 

``` 
git commit -m "your-commit-message"

```


5. If you have not created github repository, create one. 

6. Add github repository to your local. 

```bash
git remote add origin your-repository-url 

```

For example: 
```
git remote add origin https://github.com/hmmisthisgood/broadway-april.git
```

7. push the code 

``` bash 
git push origin master 
```