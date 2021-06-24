# Demos using Jupyterlab

This repo was forked from larryebaum/hc_demos-jupyter. The contents below is a summary of a [presentation](https://docs.google.com/presentation/d/13jMRMsClaQvJ0C2YlxoU-yrhyezhZ0UPUhSAT3WN0cI/edit#slide=id.g55c21e2b16_2_1834) delivered by Larry Eichenbaum and James Nyika.

Agenda:
* What is Jupyter, Jupyter Lab and the use case 
* When to Jupyter 
* Existing Content Overview
* Demo
* How the Sausage is made - setting up Jupyter for yourself
* Questions

## What is Jupyter / Jupyter Lab ?

* **Jupyter Notebook** is an open-source web application that allows you to create and share documents that contain live code, equations, visualizations and narrative text
* **JupyterLab** is a web-based interactive development environment for Jupyter notebooks, code, and data. JupyterLab is the next-generation user interface for Jupyter notebooks that is more modular, allows you to open multiple notebooks at once and provides other useful features. 
* Project Jupyter (https://jupyter.org/ ) is where it is hosted and maintained. 

## The Use Case & Value 

* Jupyter Lab can run different kernels. The most common is the python kernel. 
* A lesser known kernel is the bash / shell kernel
* 💰: Allows notebooks to be used like a bash shell 
* **Use Jupyter Lab to execute CLI commands to Vault, Nomad, Consul, or Terraform as part of a demo for a better experience**

## When to use Jupyter vs Instruqt

Jupyter excels when:

* You need to run a demo scenario with limited time
* You need to focus on telling a story and speaking
* You need to provide your audience with a history of the demo actions in a standard human readable format
* You need a non video recording of your demo
* You need to reuse your demo as a reference document 
* You need to customize the experience for the customer 

---

## Existing Content

* Ready to use demos:
    * http://bit.ly/HC-SE-Demos
    * To be moved into GH `hashicorp/solutions_eng` sub-org once available.
* Header artwork:
    * http://bit.ly/Jupyter_Headers-James 
    * http://bit.ly/Jupyter_Headers-Larry 

## DEMO

---

## Installation / Configuration of Jupyterlab

Official Docs: https://jupyterlab.readthedocs.io/en/stable/ 

### Mac / Homebrew

```shell
brew update && brew doctor
brew install python3
brew install jupyterlab
brew install pip3
pip3 install ipykernel
pip3 install bash_kernel
python -m bash_kernel.install
```

For a more custom environment

```shell
brew upgrade
brew install pyenv
pyenv versions
echo 'eval "$(pyenv init -)"' >> ~/.bash_profile
```

Additional Reference:
https://medium.com/@blessedmarcel1/how-to-install-jupyter-notebook-on-mac-using-homebrew-528c39fd530f

### Extras

Install Latex
Mac - http://tug.org/mactex/mactex-download.html

### Windows 

You need to do more - install Anaconda and configure: https://mycarta.wordpress.com/2019/07/09/from-zero-to-jupyterlab-pro-on-windows-10/ 

## Start Jupyter Lab - Mac and Windows

Go to a folder that holds or will hold your Jupyter Notebook.
Start up Jupyter Lab

Mac :

```shell
jupyter lab
```

or

Windows : 
```
Jupyter lab
```

## Print to Notebook
[Jupyter Notebook to PDF in a few lines | by Cornellius Yudha Wijaya | Towards Data Science](https://towardsdatascience.com/jupyter-notebook-to-pdf-in-a-few-lines-3c48d68a7a63)

```
pip install -U notebook-as-pdf
# For chromium
pyppeteer-install
# For CLI
jupyter-nbconvert --to PDFviaHTML example.ipynb
```

Converting to PDF with Latex ala `mactex`
```
jupyter-nbconvert --to pdf example.ipynb
```

## Call to Action

* Setup and successfully run one of these demos on your system.
* Give us feedback on your experience and things you would like to see.
* Contribute back some notebooks and support us in making them a little more standardized. 