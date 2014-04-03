(setq dat2-array
      '[
	;; 文字長 パターン数 終了状態 「顔リスト(^^;」
	(5 4 "Done...(^ ^;)" ("(^_^) " "(^_^;)" "(^_^) " "(^_^;)"))      ;0
	(7 4 "Done...(^ ^;)" ("/(^_^)/" "/(^_^)/" "\\(^_^)\\" "\\(^_^)\\"))  ;1
	(5 4 "Done...(^ ^;)" ("(^_^)" "(; ^)" "(   )" "(^  )"))          ;2
	(5 4 "Done...(@ @;)" ("(@_@)" "(  @)" "(   )" "(@  )"))          ;3
	(5 4 "Done...(T_T;)" ("(T_T)" "(  T)" "(   )" "(T  )"))          ;4
	(6 4 "Done...(^_^;)" ("(^_^;)" "(  ^_)" "(    )" "(^  ;)"))      ;5
	(5 4 "Done...(_ _;)" ("(_ _)" "(  _)" "(   )" "(_ ;)"))          ;6
	(5 4 "Done...(^_^;)" ("(^ ^:)" "(^_^;)" "(^ ^:)" "(^_^;)"))      ;7
	])

(setq sp3 (make-string 200 32))
( defun sho-chang (&optional num)
  "Sho-chang is dancing in your Mini-buffer!"
  (interactive "P")
  (cond ((null num) (setq pa (aref dat2-array 5))); デフォルトのパターン
	(t(setq pa (aref dat2-array num))))
  (setq len (nth 0 pa))
  (setq numpat (nth 1 pa))
  (setq done (nth 2 pa))
  (setq data (nth 3 pa))
  (go-and-back len numpat)
  (garbage-collect)
  (message done))

( defun go-and-back (len p)
  (let ((n 1)(max (- (window-width) len)))
    ( while ( <= n max)
      (pri-kao n p)
      (setq n (1+ n)))
    ( while ( > n 0 )
      (pri-kao n p)
      (setq n (1- n)))))

( defun pri-kao (n p)
  ( cond ((null n) nil)
	 (t(show-show n p)
	   ;;(sit-for 0)
	   )))

( defun show-show (n p)
  (setq x (make-string n 32))
  (message "%s%s" x (get-n n p data)))

( defun get-n (n p str)
  (cond ((null str) nil)
	(t(nth (mod n p) str))))
