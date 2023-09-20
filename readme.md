## Create name signs for teaching

1. Open a terminal and navigate to the path that you want to clone the repository to
1. Clone the repository
    ```
    $ git clone git@github.com:sbstn-gbl/name-signs.git
    ```
1. Navigate to repository path, create virtual environment and install required modules with
    ```
    $ cd name-signs && make build
    ```
1. Start a notebook server with
    ```
    $ make run
    ```
    or run notebook with `papermill`
    ```
    $ papermill create-name-sign.ipynb create-name-sign.ipynb \
        -p FILE_SECRET YOUR_INPUT \
        -p FILE_OUTPUT YOUR_INPUT \
        -p SHEET YOUR_INPUT \
        -p TAB YOUR_INPUT
    ```