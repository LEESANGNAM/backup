
// ClassAdd2Dlg.h: 헤더 파일
//
#include "CInContact.h"
#include "CInName.h"
#include "COutAll.h"
#pragma once


// CClassAdd2Dlg 대화 상자
class CClassAdd2Dlg : public CDialogEx
{
// 생성입니다.
public:
	CClassAdd2Dlg(CWnd* pParent = nullptr);	// 표준 생성자입니다.

	CInName m_InNameDlg;
	CInContact m_InContactDlg;
	COutAll m_OutAllDlg;

// 대화 상자 데이터입니다.
#ifdef AFX_DESIGN_TIME
	enum { IDD = IDD_CLASSADD2_DIALOG };
#endif

	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV 지원입니다.


// 구현입니다.
protected:
	HICON m_hIcon;

	// 생성된 메시지 맵 함수
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	DECLARE_MESSAGE_MAP()
public:
	afx_msg void OnBnClickedButtonNameIn();
	afx_msg void OnBnClickedButtonContactIn();
	afx_msg void OnBnClickedButtonNameOut();
	afx_msg void OnBnClickedButtonAllOut();
	afx_msg void OnBnClickedButtonExit();
};
