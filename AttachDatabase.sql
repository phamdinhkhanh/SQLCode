--Điều kiện: các file mdf và file log chưa có một database nào phụ trách quyền
--Nếu được attach từ các file đã được attach database sẵn sẽ gặp lỗi 
--Unable to open the physical file "E:\SQLData\Data\AttachStudentDB.mdf". Operating system error 32: "32(The process cannot access the file because it is being used by another process.)".
CREATE DATABASE TestAttach
	ON (FILENAME = 'E:\SQLData\Data\AttachStudentDB.mdf'),
	(FILENAME = 'E:\SQLData\Data\AttachStudentDB_log.ldf')
	FOR ATTACH
--Trường hợp không có log file sẽ tự tạo log file
CREATE DATABASE TestAttach
	ON (FILENAME = 'E:\SQLData\Data\TestAttach.mdf')
	FOR ATTACH
