;;-----------------------------------------------------------------------------
;; E-Book Management Smart Contract
;;-----------------------------------------------------------------------------
;; This contract allows users to manage e-book metadata. Users can:
;; 1. Upload new e-books with a title and have their ownership recorded.
;; 2. Retrieve metadata for an e-book using its unique ID.
;; The contract ensures title validation and provides error handling.
;;-----------------------------------------------------------------------------

;; Error Codes
(define-constant ERR-NOT-FOUND (err u301)) ;; Error when an e-book ID is not found
(define-constant ERR-TITLE (err u303))     ;; Error when the title is empty

;;-----------------------------------------------------------------------------
;; Data Storage
;;-----------------------------------------------------------------------------

;; Tracks the total number of e-books uploaded
(define-data-var total-ebooks uint u0)

;; Maps unique e-book IDs to their metadata (title and author)
(define-map ebooks
    { ebook-id: uint }                     ;; Key: Unique ID for each e-book
    { 
        title: (string-ascii 64),          ;; E-book title, max 64 ASCII characters
        author: principal                  ;; Principal (address) of the e-book owner
    }
)

;;-----------------------------------------------------------------------------
;; Public Functions
;;-----------------------------------------------------------------------------

;; Upload a new e-book
(define-public (upload-ebook (title (string-ascii 64)))
    (let
        ((new-id (+ (var-get total-ebooks) u1))) ;; Generate new e-book ID

        ;; Validate that the title is not empty
        (asserts! (> (len title) u0) ERR-TITLE)

        ;; Save e-book metadata into the map
        (map-insert ebooks
            { ebook-id: new-id }
            { title: title, author: tx-sender }
        )

        ;; Update the total e-books count
        (var-set total-ebooks new-id)

        ;; Return the new e-book ID as confirmation
        (ok new-id)
    )
)

;; Retrieve metadata for a specific e-book by its ID
(define-public (get-ebook (ebook-id uint))
    ;; Check if the e-book exists and return its metadata or an error
    (match (map-get? ebooks { ebook-id: ebook-id })
        book (ok book)                      ;; If found, return the metadata
        ERR-NOT-FOUND                      ;; Otherwise, return an error
    )
)
