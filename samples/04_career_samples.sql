-- 5️⃣ 더미 게시글 삽입 (member_id 1, 2)
INSERT INTO `Career_Info_Post`
(`member_id`, `company`, `year`, `title`, `status`, `reject_reason`, `visibility`, `content`, `image_url`, `comment_count`, `like_count`, `created_at`)
VALUES
(1, '삼성전자', '2024', '삼성전자 코테 후기', 'APPROVED', NULL, 'Y', '삼성전자 코테는 구현 문제 위주로 출제됩니다.', NULL, 0, 5, '2024-05-01'),
(2, '카카오', '2024', '카카오 1차 면접 후기', 'APPROVED', NULL, 'Y', '카카오 면접에서는 협업 경험에 대해 많이 물어봤어요.', NULL, 0, 12, '2024-06-15'),
(1, '네이버', '2023', '네이버 코딩테스트 후기', 'PENDING', NULL, 'Y', 'DFS, BFS 문제 위주였습니다.', NULL, 0, 0, '2024-07-20'),
(2, 'LG전자', '2022', 'LG전자 면접 후기', 'REJECTED', '내용이 부적절합니다.', 'Y', '인성 질문이 많았습니다.', NULL, 0, 0, '2024-08-01'),
(1, '카카오', '2025', '카카오 2차 면접 준비 팁', 'APPROVED', NULL, 'Y', '기술 질문 대비를 철저히 해야 합니다.', NULL, 0, 10, '2024-09-12'),
(2, '삼성전자', '2025', '삼성전자 SW역량테스트 후기', 'APPROVED', NULL, 'Y', 'A형 문제 중심, 자료구조 중요.', NULL, 0, 15, '2024-09-20'),
(1, '네이버', '2024', '네이버 리쿠르팅 후기', 'NONE', NULL, 'Y', '사전 테스트가 어려웠습니다.', NULL, 0, 0, '2024-09-25'),
(2, 'LG전자', '2023', 'LG전자 코테 후기', 'PENDING', NULL, 'Y', '난이도는 중간 정도였습니다.', NULL, 0, 0, '2024-10-01'),
(1, '카카오', '2022', '카카오 블라인드 채용 후기', 'APPROVED', NULL, 'Y', '실제 면접 분위기는 부드러웠습니다.', NULL, 0, 9, '2024-10-05'),
(2, '삼성전자', '2023', '삼성전자 면접 후기 (2023)', 'APPROVED', NULL, 'Y', 'PT 면접에서 기술 발표 중심이었습니다.', NULL, 0, 11, '2024-10-10');

-- 6️⃣ 더미 댓글 삽입
INSERT INTO `Career_Info_Comment`
(`parent_id`, `post_id`, `member_id`, `content`, `visibility`, `created_at`, `updated_at`)
VALUES
(NULL, 1, 2, '좋은 후기 감사합니다!', 'Y', '2024-05-02', NULL),
(NULL, 1, 1, '저도 같은 문제 나왔어요!', 'Y', '2024-05-03', NULL),
(NULL, 2, 1, '면접 질문이 흥미롭네요.', 'Y', '2024-06-16', NULL),
(NULL, 2, 2, '협업 관련 질문은 매년 나오더라고요.', 'Y', '2024-06-17', NULL),
(NULL, 5, 2, '팁 감사합니다. 큰 도움이 됐어요.', 'Y', '2024-09-13', NULL),
(NULL, 6, 1, '자료구조는 어떤 걸 공부하셨나요?', 'Y', '2024-09-21', NULL),
(1, 1, 1, '맞아요! 구현력 테스트가 핵심이었죠.', 'Y', '2024-05-04', NULL),
(NULL, 9, 2, '분위기 부드럽다니 다행이네요.', 'Y', '2024-10-06', NULL),
(NULL, 10, 1, 'PT 면접 준비는 어떻게 하셨나요?', 'Y', '2024-10-11', NULL),
(NULL, 5, 1, '면접 준비법 공유 감사합니다!', 'Y', '2024-09-14', NULL);

-- 7️⃣ 게시글별 댓글 수 자동 업데이트
set SQL_SAFE_UPDATES = 0;

UPDATE `Career_Info_Post` p
SET `comment_count` = (
  SELECT COUNT(*) 
  FROM `Career_Info_Comment` c 
  WHERE c.`post_id` = p.`id`
)
WHERE p.`id` IS NOT NULL;