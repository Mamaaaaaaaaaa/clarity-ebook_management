# 📚 E-Book Management Smart Contract

The **E-Book Management Smart Contract** is a decentralized application (dApp) for managing e-book metadata on the blockchain. This platform facilitates secure, transparent, and efficient storage, management, and sharing of e-books. 

The contract provides a range of functionalities, including uploading e-books, transferring ownership, updating metadata, and access control, ensuring proper validation and error handling throughout. 

With its decentralized nature, this contract empowers users with complete control over their e-books while fostering a secure and reliable system for e-book management.

---

## ✨ Features

1. **Upload New E-Books**  
   Users can upload e-books with metadata such as title, file size, summary, and categories.

2. **Retrieve Metadata**  
   Fetch detailed metadata for any e-book by its unique ID.

3. **Ownership Management**  
   Authors can transfer ownership of an e-book to another user securely.

4. **Update Metadata**  
   Authors can modify metadata of their e-books to keep information current.

5. **Access Control**  
   Authors and designated users can manage access to specific e-books.

6. **Error Handling**  
   Standardized error codes ensure seamless error identification and resolution.

---

## 📜 How It Works

### Key Concepts
- **Decentralization**: All data is stored on the blockchain, ensuring transparency and immutability.
- **Ownership**: E-books are tied to the principal ID of their authors. Ownership can be transferred.
- **Validation**: Inputs such as title, file size, and categories are strictly validated to maintain data integrity.
- **Access Rights**: Permissions are managed for users to allow or restrict access to specific e-books.

### Smart Contract Components
- **Constants**: Define system limits (e.g., max title length, max file size) and error codes for consistency.
- **Data Storage**: Utilizes maps to store e-book metadata and user access permissions.
- **Functions**: Public functions enable interaction with the contract, while private functions handle internal operations.

---

## 📂 Data Model

### E-Book Metadata
Each e-book's metadata is stored with the following structure:
- **`title`**: ASCII string (max 64 characters)
- **`author`**: Principal ID of the uploader
- **`file-size`**: File size in bytes
- **`upload-time`**: Block height at the time of upload
- **`summary`**: ASCII string summary (max 256 characters)
- **`categories`**: List of ASCII strings (max 8, each 32 characters)

### Access Rights
Access permissions are stored in a map with the structure:
- **`ebook-id`**: E-book's unique ID
- **`user`**: Principal ID of the user
- **`can-access`**: Boolean indicating whether the user has access

---

## ⚙️ Available Functions

### 📖 Public Functions

#### **`upload-ebook`**
Uploads a new e-book to the library.  
**Inputs**:  
- `title`: E-book title  
- `file-size`: Size of the file in bytes  
- `summary`: Short description of the e-book  
- `categories`: List of up to 8 categories  

**Output**: Unique ID of the newly uploaded e-book.

#### **`get-ebook-metadata`**
Retrieves metadata for a specific e-book.  
**Input**: `ebook-id` (Unique ID of the e-book)  
**Output**: Metadata of the e-book or an error if not found.

#### **`transfer-ownership`**
Transfers ownership of an e-book to another user.  
**Inputs**:  
- `ebook-id`: Unique ID of the e-book  
- `new-author`: Principal ID of the new owner  

**Output**: Success or error.

#### **`update-ebook`**
Updates metadata for an existing e-book.  
**Inputs**:  
- `ebook-id`: Unique ID of the e-book  
- `new-title`: Updated title  
- `new-size`: Updated file size  
- `new-summary`: Updated summary  
- `new-categories`: Updated list of categories  

**Output**: Success or error.

#### **`delete-ebook`**
Deletes an e-book permanently.  
**Input**: `ebook-id` (Unique ID of the e-book)  
**Output**: Success or error.

### 🔒 Private Functions
- **`ebook-exists?`**: Checks if an e-book exists.  
- **`is-author?`**: Verifies if the caller is the author of an e-book.  
- **`get-ebook-size`**: Retrieves the file size of an e-book.  
- **`is-valid-category?`**: Validates a single category string.  
- **`are-categories-valid?`**: Validates a list of categories.

---

## 🚨 Error Codes

| Code   | Description                   |
|--------|-------------------------------|
| `u301` | E-book not found              |
| `u302` | E-book already exists         |
| `u303` | Invalid e-book title          |
| `u304` | Invalid file size             |
| `u305` | Unauthorized access           |
| `u306` | Invalid recipient for transfer|
| `u307` | Admin-only action             |
| `u308` | Access rights invalid         |
| `u309` | Access denied                 |

---

## 📊 System Constraints

- **Maximum Title Length**: 64 characters  
- **Maximum Summary Length**: 256 characters  
- **Maximum Categories**: 8 (each up to 32 characters)  
- **Maximum File Size**: 1 GB (1,000,000,000 bytes)

---

## 🌟 Why Use This Smart Contract?

1. **Security**: Built on blockchain, ensuring data immutability and tamper-proof records.
2. **Transparency**: Full visibility into e-book metadata and transactions.
3. **Flexibility**: Easy-to-use functions for uploading, updating, and managing e-books.
4. **Scalability**: Efficiently handles large numbers of e-books with robust error handling.

---

## 🛠 Development

### Prerequisites
- Blockchain environment supporting Clarity 2.0 smart contracts
- Familiarity with Clarity language syntax and operations

### Deployment
1. Compile the contract using the Clarity runtime.
2. Deploy the contract to your desired blockchain testnet or mainnet.
3. Interact with the contract using blockchain tools or scripts.

---

## 🖥 Example Usage

### Upload an E-Book
```clarity
(upload-ebook "Decentralized Library" u524288 "A comprehensive guide to decentralized libraries." ['education', 'blockchain'])
```

### Retrieve Metadata
```clarity
(get-ebook-metadata u1)
```

### Transfer Ownership
```clarity
(transfer-ownership u1)
```

---

## 📩 Contact

For inquiries or contributions, please contact the project team at **[nkolisado@gmail.com.com](mailto:nkolisado@gmail.com)**.

--- 

**License**: Open-source under the MIT License. Feel free to use, modify, and distribute this smart contract.  
```