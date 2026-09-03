#!/bin/bash

# ==============================================================================
# AUTHORSHIP VERIFICATION SCRIPT
# This script decrypts 'roadmap.enc' using standard OpenSSL commands
# and then automatically verifies its integrity against 'hash.txt'.
# ==============================================================================

set -e

echo "=========================================================="
echo " Starting Roadmap Document Verification"
echo "=========================================================="

if [ ! -f "hash.txt" ] || [ ! -f "roadmap.enc" ]; then
    echo "❌ Error: 'hash.txt' or 'roadmap.enc' is missing from this folder."
    exit 1
fi

# ------------------------------------------------------------------------------
# STEP 1: Decrypt the Encrypted File
# ------------------------------------------------------------------------------
echo "STEP 1: Decrypting 'roadmap.enc' to verify original ownership..."
echo "Please enter the author's decryption password when prompted."

openssl enc -d -aes-256-cbc -pbkdf2 -a -in roadmap.enc -out roadmap.txt

echo ""
echo "✔ SUCCESS: Decryption complete! 'roadmap.txt' has been generated."
echo "----------------------------------------------------------"

# ------------------------------------------------------------------------------
# STEP 2: Verify the Newly Extracted Plaintext Hash
# ------------------------------------------------------------------------------
echo "STEP 2: Verifying that the decrypted file matches the historical hash..."

# Check if macOS or Linux to use the correct command
if command -v sha256sum &> /dev/null; then
    sha256sum -c hash.txt
else
    # Fallback for macOS native command format
    shasum -a 256 -c hash.txt
fi

echo ""
echo "=========================================================="
echo " VERIFICATION COMPLETE: The document is valid and unaltered."
echo "=========================================================="

