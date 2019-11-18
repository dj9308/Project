package vo;

public class PagingVO {
    private int pageSize = 12; //한 페이지당 게시글 수
    private int rangeSize = 5; //한 블럭(range)당 페이지 수
    private int curPage = 1; //현재 페이지
    private int curRange = 1; //현재 블럭(range)
    private int listCnt; //총 게시글 수
    private int pageCnt; //총 페이지 수
    private int rangeCnt; //총 블럭(range) 수
    private int startPage = 1; //시작 페이지
    private int endPage = 1; //끝 페이지
    private int startIndex = 1; //시작 index
    private int endIndex = 1; //마지막 index
    private int prevPage; //이전 페이지
    private int nextPage; //다음 페이지

	public PagingVO(int listCnt, int curPage){   
        setCurPage(curPage); //현재페이지
        setListCnt(listCnt); //총 게시물 수
        setPageCnt(listCnt); //총 페이지 수
        setRangeCnt(pageCnt); //총 블럭(range)수
        rangeSetting(curPage); //블럭(range) setting
        setStartIndex(curPage);
        setEndIndex(curPage);
    }
	public void rangeSetting(int curPage){
	    setCurRange(curPage);        
	    this.startPage = (curRange - 1) * rangeSize + 1; //블럭의 시작 페이지
	    this.endPage = startPage + rangeSize - 1; //블럭의 끝 페이지
	    
	    if(endPage > pageCnt){
	        this.endPage = pageCnt;
	    }
	    this.prevPage = curPage - 1;
	    this.nextPage = curPage + 1;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getRangeSize() {
		return rangeSize;
	}
	public void setRangeSize(int rangeSize) {
		this.rangeSize = rangeSize;
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getCurRange() {
		return curRange;
	}
	public void setCurRange(int curRange) {
		 this.curRange = (int)((curPage-1)/rangeSize) + 1;
	}
	public int getListCnt() {
		return listCnt;
	}
	public void setListCnt(int listCnt) {
		this.listCnt = listCnt;
	}
	public int getPageCnt() {
		return pageCnt;
	}
	public void setPageCnt(int listCnt) {
		this.pageCnt = (int) Math.ceil(listCnt*1.0/pageSize); //전체 페이지 수 계산
	}
	public int getRangeCnt() {
		return rangeCnt;
	}
	public void setRangeCnt(int pageCnt) { //전체 블럭수 계산
		 this.rangeCnt = (int) Math.ceil(pageCnt*1.0/rangeSize);
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(int curPage) {
		this.startIndex = (curPage - 1) * pageSize + 1;
	}
	public int getEndIndex() {
		return endIndex;
	}
	public void setEndIndex(int curPage) {
		this.endIndex = startIndex + pageSize - 1;
	}
	public int getPrevPage() {
		return prevPage;
	}
	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}
	public int getNextPage() {
		return nextPage;
	}
	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}
}
