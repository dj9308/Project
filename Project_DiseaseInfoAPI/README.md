# Introduction

- Please provide information of disease

## ![ledger](https://github.githubassets.com/images/icons/emoji/unicode/1f4d2.png) Index

- [About](https://gist.github.com/ramantehlan/602ad8525699486e097092e4158c5bf1#beginner-about)
- Usage
  - [Installation](https://gist.github.com/ramantehlan/602ad8525699486e097092e4158c5bf1#electric_plug-installation)
  - [Commands](https://gist.github.com/ramantehlan/602ad8525699486e097092e4158c5bf1#package-commands)
- Development
  - [Pre-Requisites](https://gist.github.com/ramantehlan/602ad8525699486e097092e4158c5bf1#notebook-pre-requisites)
  - [Developmen Environment](https://gist.github.com/ramantehlan/602ad8525699486e097092e4158c5bf1#nut_and_bolt-development-environment)
  - [File Structure](https://gist.github.com/ramantehlan/602ad8525699486e097092e4158c5bf1#file_folder-file-structure)
  - [Build](https://gist.github.com/ramantehlan/602ad8525699486e097092e4158c5bf1#hammer-build)
  - [Deployment](https://gist.github.com/ramantehlan/602ad8525699486e097092e4158c5bf1#rocket-deployment)
- Community
  - [Contribution](https://gist.github.com/ramantehlan/602ad8525699486e097092e4158c5bf1#fire-contribution)
  - [Branches](https://gist.github.com/ramantehlan/602ad8525699486e097092e4158c5bf1#cactus-branches)
  - [Guideline](https://gist.github.com/ramantehlan/602ad8525699486e097092e4158c5bf1#exclamation-guideline)
- [FAQ](https://gist.github.com/ramantehlan/602ad8525699486e097092e4158c5bf1#question-faq)
- [Resources](https://gist.github.com/ramantehlan/602ad8525699486e097092e4158c5bf1#page_facing_up-resources)
- [Gallery](https://gist.github.com/ramantehlan/602ad8525699486e097092e4158c5bf1#camera-gallery)
- [Credit/Acknowledgment](https://gist.github.com/ramantehlan/602ad8525699486e097092e4158c5bf1#star2-creditacknowledgment)
- [License](https://gist.github.com/ramantehlan/602ad8525699486e097092e4158c5bf1#lock-license)

## ![beginner](https://github.githubassets.com/images/icons/emoji/unicode/1f530.png) About

Add a detailed introduction about the project here, everything you want the reader to know.

## ![zap](https://github.githubassets.com/images/icons/emoji/unicode/26a1.png) Usage

- Clone Project into your workspace

  ```bash
  $ clone https://github.com/ysgo/DiseaseInfoAPI.git
  ```

- change directory into project folder

  ```bash
  $ cd ../DiseaseInfoAPI/
  ```

- execute vscode into project folder and virtual environment

  ```bash
  $ code .
  # window
  $ source .venv/Scripts/activate
  # linux
  $ source .venv/bin/activate
  ```

- install python library

  ```bash
  $ pip list
  $ pip install django
  # config
  $ pip install python-decouple
  # REST Framework library
  $ pip install djangorestframework djangorestframework-jwt
  ```
  
- django project runserver

  ```bash
  $ python manage.py runserver
  ```

### ![electric_plug](https://github.githubassets.com/images/icons/emoji/unicode/1f50c.png) Installation

- Steps on how to install this project, to use it.
- Be very detailed here, For example, if you have tools which run on different operating systems, write installation steps for all of them.

```
$ add installations steps if you have to.
```

### ![package](https://github.githubassets.com/images/icons/emoji/unicode/1f4e6.png) Commands

- Commands to start the project.

## ![wrench](https://github.githubassets.com/images/icons/emoji/unicode/1f527.png) Development

If you want other people to contribute to this project, this is the section, make sure you always add this.

### ![notebook](https://github.githubassets.com/images/icons/emoji/unicode/1f4d3.png) Pre-Requisites

- Installed Python
- Installed Visual Studio Code
- Required Primary Key by .env

### ![nut_and_bolt](https://github.githubassets.com/images/icons/emoji/unicode/1f529.png) Development Environment

- Write about setting up the working environment for your project.
  - How to download the project...
  - How to install dependencies...

### ![file_folder](https://github.githubassets.com/images/icons/emoji/unicode/1f4c1.png) File Structure

Add a file structure here with the basic details about files, below is an example.

```
.
├── static
│   ├── css
│   │   └── index-ui.css
│   ├── images
│   │   ├── icons
│   │   │   └── shrink-button.png
│   │   └── Untitled-1.psd
│   └── javascript
│       ├── index.js
│       └── rate.js
├── media
│   └── css
│      	└── index-ui.css
├── diseaseInfo
│   └── templates
│  		└── diseaseInfo
│   	   	 └── index.html
└── README.md
```

| No   | File Name | Details     |
| ---- | --------- | ----------- |
| 1    | index     | Entry point |

### ![hammer](https://github.githubassets.com/images/icons/emoji/unicode/1f528.png) Build

Write the build Instruction here.

### ![rocket](https://github.githubassets.com/images/icons/emoji/unicode/1f680.png) Deployment

Write the deployment instruction here.

## ![cherry_blossom](https://github.githubassets.com/images/icons/emoji/unicode/1f338.png) Community

If it's open-source, talk about the community here, ask social media links and other links.

### ![fire](https://github.githubassets.com/images/icons/emoji/unicode/1f525.png) Contribution

Your contributions are always welcome and appreciated. Following are the things you can do to contribute to this project.

1. **Report a bug**
   If you think you have encountered a bug, and I should know about it, feel free to report it [here](https://gist.github.com/ramantehlan/602ad8525699486e097092e4158c5bf1) and I will take care of it.
2. **Request a feature**
   You can also request for a feature [here](https://gist.github.com/ramantehlan/602ad8525699486e097092e4158c5bf1), and if it will viable, it will be picked for development.
3. **Create a pull request**
   It can't get better then this, your pull request will be appreciated by the community. You can get started by picking up any open issues from [here](https://gist.github.com/ramantehlan/602ad8525699486e097092e4158c5bf1) and make a pull request.

> If you are new to open-source, make sure to check read more about it [here](https://www.digitalocean.com/community/tutorial_series/an-introduction-to-open-source) and learn more about creating a pull request [here](https://www.digitalocean.com/community/tutorials/how-to-create-a-pull-request-on-github).

### ![cactus](https://github.githubassets.com/images/icons/emoji/unicode/1f335.png) Branches

I use an agile continuous integration methodology, so the version is frequently updated and development is really fast.

1. **`stage`** is the development branch.
2. **`master`** is the production branch.
3. No other permanent branches should be created in the main repository, you can create feature branches but they should get merged with the master.

**Steps to work with feature branch**

1. To start working on a new feature, create a new branch prefixed with `feat` and followed by feature name. (ie. `feat-FEATURE-NAME`)
2. Once you are done with your changes, you can raise PR.

**Steps to create a pull request**

1. Make a PR to `stage` branch.
2. Comply with the best practices and guidelines e.g. where the PR concerns visual elements it should have an image showing the effect.
3. It must pass all continuous integration checks and get positive reviews.

After this, changes will be merged.

### ![exclamation](https://github.githubassets.com/images/icons/emoji/unicode/2757.png) Guideline

coding guidelines or other things you want people to follow should follow.

## ![question](https://github.githubassets.com/images/icons/emoji/unicode/2753.png) FAQ

You can optionally add a FAQ section about the project.

## ![page_facing_up](https://github.githubassets.com/images/icons/emoji/unicode/1f4c4.png) Resources

Add important resources here

## ![camera](https://github.githubassets.com/images/icons/emoji/unicode/1f4f7.png) Gallery

Pictures of your project.

## ![star2](https://github.githubassets.com/images/icons/emoji/unicode/1f31f.png) Credit/Acknowledgment

Credit the authors here.

## ![lock](https://github.githubassets.com/images/icons/emoji/unicode/1f512.png) License

Add a license here, or a link to it.