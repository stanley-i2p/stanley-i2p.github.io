## How to Verify My Roadmap Authorship

If you want to manually verify that this original roadmap was written on the recorded Git/Wayback timestamp, you can run the verification script natively or use manual terminal commands. You do not need any pre-revealed files; the extraction handles everything.

### Option A: Run the verification script
1. Download `roadmap.enc`, `hash.txt`, and `verify.sh` into the same folder.
2. Open your terminal in that folder and run:
   ```bash
   bash verify.sh
   ```
3. Enter the password when prompted. The script will automatically decrypt the file and verify its hash integrity.

### Option B: Manual Terminal Commands (No Script)
If you prefer not to execute a shell script, run these standard commands natively:

1. **Decrypt and extract the Document:**
   ```bash
   openssl enc -d -aes-256-cbc -pbkdf2 -a -in roadmap.enc -out roadmap.txt
   ```
2. **Verify the Hash Match of the extracted file:**
   ```bash
   sha256sum -c hash.txt
   ```

