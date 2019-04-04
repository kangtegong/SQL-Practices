----------------------------------------------------------------------------------
 3����  ��������
----------------------------------------------------------------------------------
1. EMP ���̺��� �Ʒ��� ���ǿ� �°� ��ȸ �ϼ���.
   - �μ���ȣ(DEPTNO), ���� ��ȸ
   - �μ���ȣ(DEPTNO)���� ������ ��ȸ�ϰ�, �μ���ȣ �������� �����ϼ���.;

SELECT DEPTNO, COUNT(*)
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO
;

2. EMP ���̺��� �Ʒ��� ���ǿ� �°� ��ȸ �ϼ���.
   - �μ���ȣ(DEPTNO), �޿�(SAL) �հ� ��ȸ
   - �μ���ȣ(DEPTNO)���� �޿�(SAL)  �հ踦 ��ȸ�ϰ�, 
      �޿��� ���� �μ������� �����ϼ���.;

SELECT DEPTNO, SUM(SAL) AS SAL_SUM
FROM EMP
GROUP BY DEPTNO
ORDER BY SAL_SUM
;


3. EMP ���̺��� �Ʒ��� ���ǿ� �°� ��ȸ �ϼ���.
   - �μ���ȣ(DEPTNO), ����(JOB), �޿�(SAL) ��� ��ȸ
   - �μ���ȣ(DEPTNO)�������� ����(JOB)���� �޿�(SAL) ����� ���ϰ�
     �μ���ȣ, ���� �������� �����ϼ���.

SELECT DEPTNO, JOB, AVG(SAL) AS SAL_AVG
FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB
;

4. EMP ���̺��� �Ʒ��� ���ǿ� �°� ��ȸ �ϼ���.
   - �μ���ȣ(DEPTNO), ����(JOB), �޿�(SAL) ��� ��ȸ
   - �μ���ȣ(DEPTNO)�������� ����(JOB)���� �޿�(SAL) ����� ���ϰ�
     ���� �μ���ȣ(DEPTNO)�� 10�� �μ��� ��ȸ �ϼ���;

SELECT DEPTNO, JOB, AVG(SAL) AS SAL_AVG
FROM EMP
WHERE DEPTNO = 10
GROUP BY DEPTNO, JOB
--HAVING DEPTNO = 10
;
SELECT DEPTNO, JOB, AVG(SAL) AS SAL_AVG
FROM EMP
WHERE DEPTNO = 10
GROUP BY DEPTNO, JOB
HAVING AVG(SAL) >= 2000
;

5. EMP ���̺��� �Ʒ��� ���ǿ� �°� ��ȸ �ϼ���.
   - ������(MGR), �޿�(SAL)�հ� ��ȸ
   - ������(MGR)���� �޿�(SAL)�հ踦 ���Ͽ� 
     ���� 6000�� �ʰ��ϴ� �����ڸ� ��ȸ �ϼ���;

SELECT MGR, SUM(SAL)
FROM EMP
GROUP BY MGR
HAVING SUM(SAL) > 6000
;

6. EMP ���̺��� �Ʒ��� ���ǿ� �°� ��ȸ �ϼ���.
   - �޿�(SAL) �ִ�, �޿�(SAL) �ּ�, Ŀ�̼�(COMM) �ִ�, Ŀ�̼�(COMM) �ּ� ��ȸ
   - �޿�(SAL) �ִ�, �޿�(SAL) �ּ�, Ŀ�̼�(COMM) �ִ�, Ŀ�̼�(COMM) �ּҸ� ���ϼ���.;
SELECT MAX(SAL), MIN(SAL), MAX(COMM), MIN(COMM)
FROM EMP
;


7. EMP ���̺��� �Ʒ��� ���ǿ� �°� ��ȸ �ϼ���.
   - ����(JOB), �޿�(SAL) �ִ�, �޿�(SAL) �ּ�, Ŀ�̼�(COMM) �ִ�, Ŀ�̼�(COMM) �ּ� ��ȸ
   - ����(JOB)���� �޿�(SAL) �ִ�, �޿�(SAL) �ּ�, Ŀ�̼�(COMM) �ִ�, Ŀ�̼�(COMM) �ּҸ� ���ϼ���.;
SELECT JOB, MAX(SAL), MIN(SAL), MAX(COMM), MIN(COMM)
FROM EMP
GROUP BY JOB
;

8. EMP ���̺��� �Ʒ��� ���ǿ� �°� ��ȸ �ϼ���.
   - �μ���ȣ(DEPTNO), �޿�(SAL) �ִ�, �޿�(SAL) �ּ�, Ŀ�̼�(COMM) �ִ�, Ŀ�̼�(COMM) �ּ� ��ȸ
   - �μ���ȣ(DEPTNO)���� �޿�(SAL) �ִ�, �޿�(SAL) �ּ�, 
     Ŀ�̼�(COMM) �޴� �����, Ŀ�̼�(COMM) �� �޴� ������� ���ϼ���.;
SELECT DEPTNO, MAX(SAL), MIN(SAL), COUNT(COMM), COUNT(*) - COUNT(COMM)
     , SUM(DECODE(COMM,NULL,1,DECODE(COMM,0,1,0)))
     , SUM(CASE WHEN COMM IS NULL OR COMM = 0 THEN 1
            ELSE 0 
       END)       
FROM EMP
GROUP BY DEPTNO
;


9. EMP ���̺��� �Ʒ��� ���ǿ� �°� ��ȸ �ϼ���.
   - �޿�(SAL) �ִ�, �޿�(SAL) �ּ�, �ο��� ��ȸ
   - �޿��� 1000������ ����� �޿�(SAL) �ִ�, �޿�(SAL) �ּ�, �ο����� ���ϼ���.;
SELECT MAX(SAL), MIN(SAL), COUNT(*)
FROM EMP
WHERE SAL <= 1000
;

10. EMP ���̺��� �Ʒ��� ���ǿ� �°� ��ȸ �ϼ���.
   - �μ���ȣ(DEPTNO), ����(JOB), �޿�(SAL) �հ� ��ȸ
   - �μ���ȣ(DEPTNO)�������� ����(JOB)���� �޿�(SAL) �հ踦 ���ϰ�
     ������ �ο쿡 ��ü �޿��հ踦 ��ȸ�ϸ� 
     �̶� �μ���ȣ�÷��� NULL�� �����÷����� '�հ�'�� ǥ���Ͽ� ��ȸ �ϼ���.;

SELECT DEPTNO, JOB, SUM(SAL)
FROM EMP
WHERE DEPTNO = 10
GROUP BY DEPTNO, JOB
UNION ALL
SELECT 10, '�Ұ�', SUM(SAL)
FROM EMP
WHERE DEPTNO = 10
UNION ALL
SELECT DEPTNO, JOB, SUM(SAL)
FROM EMP
WHERE DEPTNO = 20
GROUP BY DEPTNO, JOB
UNION ALL
SELECT 20, '�Ұ�', SUM(SAL)
FROM EMP
WHERE DEPTNO = 20
UNION ALL
SELECT DEPTNO, JOB, SUM(SAL)
FROM EMP
WHERE DEPTNO = 30
GROUP BY DEPTNO, JOB
UNION ALL
SELECT 30, '�Ұ�', SUM(SAL)
FROM EMP
WHERE DEPTNO = 30
UNION ALL
SELECT NULL, '�հ�', SUM(SAL)
FROM EMP
;


SELECT DEPTNO, JOB, SUM(SAL)
FROM EMP
GROUP BY ROLLUP( DEPTNO, JOB )
;


SELECT DEPTNO, JOB, SUM(SAL)
FROM EMP
GROUP BY ROLLUP( (DEPTNO, JOB) )
;

