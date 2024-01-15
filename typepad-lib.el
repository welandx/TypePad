;; copy from purcell https://gist.github.com/purcell/34824f1b676e6188540cdf71c7cc9fc4
(defun key-quiz--shuffle-list (list)
  "Shuffles LIST randomly, modying it in-place."
  (dolist (i (reverse (number-sequence 1 (1- (length list)))))
    (let ((j (random (1+ i)))
	  (tmp (elt list i)))
      (setf (elt list i) (elt list j))
      (setf (elt list j) tmp)))
  list)

(defun split-string-every (str n)
  (let ((result '()))
    (dotimes (i (ceiling (/ (length str) n)))
      (push (substring str (* i n) (min (+ (* i n) n) (length str))) result))
    (nreverse result)))

(defun get-txt-file-details (directory)
  (let ((file-details '()))
    ;; 递归获取指定路径下所有文件以及子目录的文件名和路径
    (dolist (file (directory-files-recursively directory ".*\\.txt\\'"))
      ;; 如果获取到的是文件而不是目录
      (when (file-regular-p file)
        ;; 获取文件名
        (let ((file-name (file-name-sans-extension (file-name-nondirectory file))))
          ;; 将文件名和路径存入列表
          (push (list file-name file) file-details))))
    file-details))

;;; typepad-lib.el end here
(provide 'typepad-lib)
