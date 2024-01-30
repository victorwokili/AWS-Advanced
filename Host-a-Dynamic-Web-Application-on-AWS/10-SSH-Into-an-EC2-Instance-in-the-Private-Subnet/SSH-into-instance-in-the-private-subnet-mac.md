# Using SSH Agent on macOS

To use an SSH agent in macOS and link your `.pem` key from your Downloads folder, you can follow these steps:

1. **Open Terminal:**
   Launch the Terminal application on your macOS.

2. **Start SSH Agent:**
   Start the SSH agent by running the following command:

   ```shell
   eval "$(ssh-agent -s)"
    ```


This command will start the SSH agent and set the necessary environment variables.


1. ***Add Your Private Key:***

    Use the ssh-add command to add your .pem private key to the SSH agent. Replace /path/to/your/key.pem with the actual path to your key file:
    ```bash
    ssh-add -K /path/to/your/key.pem
    ```
    For example, if your key is in the Downloads folder, the command might look like this:
    ```bash
    ssh-add -K ~/Downloads/virginia.pem
    ```
    <br><br>

2. ***Enter Your Passphrase (If Applicable):***

    If your private key is protected by a passphrase, you will be prompted to enter it. Enter the passphrase associated with your key.

<br><br>

3. ***Confirm Key Addition:***
    You should see a message indicating that your key has been added to the agent. It might look something like this:
    ```bash
    Identity added: /path/to/your/key.pem (/path/to/your/key.pem)
    ```
    This means your key is now available in the SSH agent.
    <br><br>

4. ***List Added Keys:***

    You can list the keys currently added to the SSH agent using the following command:
    ```
    ssh-add -l
    ```

    It should display the fingerprint of your added key.
<br><br>

Now, your SSH key is loaded into the SSH agent and can be used for SSH authentication without needing to specify the key file each time you connect to a remote server. Remember that the key remains in the agent until you either remove it manually or restart your computer. To remove a key from the agent, you can use the ssh-add -d command followed by the path to the key.



You can copy and paste this Markdown content into a `.md` file, and it will provide instructions on using the SSH agent on macOS and linking your `.pem` key from your Downloads folder.


