----------------------------------------------------------------------------------
 1����  ��������
----------------------------------------------------------------------------------
1. EMP ���̺� ��ü Į���� ��ȸ �ϼ���.

SELECT *
FROM EMP
;

2. EMP ���̺��� �Ʒ��� ���ǿ� �°� ��ȸ �ϼ���.
   - ��ü Į�� ��ȸ
   - �μ���ȣ(DEPTNO)�� 20�Ǵ� 30�� �μ��� ��ȸ �ϼ���.

SELECT *
FROM EMP
WHERE DEPTNO = 20 OR DEPTNO = 30
;

SELECT *
FROM EMP
WHERE DEPTNO IN (20, 30)
;

3. EMP ���̺��� �Ʒ��� ���ǿ� �°� ��ȸ �ϼ���.
   - Į�� : ��ü Į�� ��ȸ
   - ��ȸ���� : �����(ENAME)�� 'A'�� �����ϴ� ����� ��ȸ
   
SELECT *
FROM EMP
WHERE ENAME LIKE 'A%'
;
   
4. EMP ���̺��� �Ʒ��� ���ǿ� �°� ��ȸ �ϼ���.
   - Į�� : EMPNO, ENAME, HIREDATE, SAL, SAL + COMM (HEADING�� TOT_SAL�� ���)
   - ��ȸ���� : JOB�� 'CLERK', 'SALESMAN', 'MANAGER' �� ��ȸ

SELECT EMPNO, ENAME, HIREDATE, SAL, SAL + COMM AS TOT_SAL, JOB
FROM EMP
WHERE JOB IN ('CLERK', 'SALESMAN', 'MANAGER')
;

-- NULL���� ��������� ��ȿ�ϵ��� NVL ���
SELECT EMPNO, ENAME, HIREDATE, SAL, SAL + NVL(COMM,0) AS TOT_SAL, JOB
FROM EMP
WHERE JOB IN ('CLERK', 'SALESMAN', 'MANAGER')
;

5. EMP ���̺��� �Ʒ��� ���ǿ� �°� ��ȸ �ϼ���.
   - Į�� : ��ü Į�� ��ȸ
   - ��ȸ���� : �����(ENAME)�� 'BLAKE'�� �޴����� ����(MGR)�ϴ� ����� ��ȸ

--�켱 BLAKE�� �����ȣ�� �˾Ƴ���

SELECT *
FROM EMP
WHERE ENAME = 'BLAKE'
;

-- BLAKE�� �����ȣ�� 7698�̴�
-- �׷� ���� 7698�� MANAGER�� ������� ��ȸ����

SELECT *
FROM EMP
WHERE MGR = 7698
;

-- JOIN�� �̿��ؼ� �����ϰ� �� �濡 ã�ƺ� ���� �ִ�

6. EMP ���̺��� �Ʒ��� ���ǿ� �°� ��ȸ �ϼ���.
   - Į�� : ��ü Į�� ��ȸ
   - ��ȸ���� : �����(ENAME)�� 'BLAKE'�� �޴����� ����(MGR)�ϴ� �����
                       ������(JOB)�� 'CLERK'�� ����� ��ȸ

SELECT *
FROM EMP
WHERE MGR = 7698 AND JOB = 'CLERK'
;

7. EMP ���̺��� �Ʒ��� ���ǿ� �°� ��ȸ �ϼ���.
   - Į�� : ��ü Į�� ��ȸ
   - ��ȸ���� : ������(JOB)��  'CLERK'�̰ų�  'MANAGER' �� ��� ��ȸ

SELECT *
FROM EMP
WHERE JOB IN ('CLERK', 'MANAGER')
;

8. EMP ���̺��� �Ʒ��� ���ǿ� �°� ��ȸ �ϼ���.
   - Į�� : ��ü Į�� ��ȸ
   - ��ȸ���� : ������(JOB)��  'CLERK'�� ����� �޿�(SAL)�� 1,000���ϰų�
                        'MANAGER'�� ����� �޿�(SAL)�� 2,500�̻��� ��� ��ȸ

SELECT *
FROM EMP
WHERE (JOB = 'CLERK' AND SAL <= 1000) OR (JOB='MANAGER' AND SAL >= 2500)
;

9. EMP ���̺��� �Ʒ��� ���ǿ� �°� ��ȸ �ϼ���.
   - Į�� : ��ü Į�� ��ȸ
   - ��ȸ���� : Ŀ�̼�(COMM)�� �ְų� ����(JOB)��  'MANAGER'�� ����� 
                        �޿�(SAL)�� 2,800���� 3,000���̿� �ִ� ��� ��ȸ

SELECT *
FROM EMP
WHERE (COMM IS NOT NULL
-- '�����Ͱ� �ְų�' == 'IS NOT NULL'
-- �ƴϸ� COMM > 0. ��� COMM > 0�� �� ��Ȯ�� ǥ��
    OR JOB = 'MANAGER')
    AND SAL BETWEEN 2800 AND 3000;
    

10. EMP ���̺��� �Ʒ��� ���ǿ� �°� ��ȸ �ϼ���.
   - Į�� : ��ü Į�� ��ȸ
   - ��ȸ���� : �����(ENAME)�� 'A'�� ���� �����
                      �μ���ȣ(DEPTNO)�� 30�� ����� Ŀ�̼�(COMM)�� 100�̻󿡼� 1,000���ϸ� �ްų�
                      �μ���ȣ(DEPTNO)�� 30�� �ƴ� ���

SELECT * 
FROM EMP
WHERE ENAME LIKE '%A%' --A�� ��� �����𸣴ϱ� �յڷ� %���̱�
    AND (EMPNO = 30 AND COMM BETWEEN 100 AND 1000
        OR
        DEPTNO != 30);

-- ��ȣ�� ��ġ�� ������ ��!        
        
11. EMP ���̺��� �Ʒ��� ���ǿ� �°� ��ȸ �ϼ���.
   - Į�� : ��ü Į�� ��ȸ
   - ��ȸ���� : �����(ENAME)�� J�� �����ϸ鼭 3��° ���ڰ� M or N�� ���

SELECT *
FROM EMP
WHERE ENAME LIKE 'J%'
AND (ENAME LIKE '__M%' OR ENAME LIKE '__N%')
;