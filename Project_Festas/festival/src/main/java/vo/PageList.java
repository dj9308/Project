package vo;

import java.util.List;

public class PageList<V> {
	private int total;
	private int currentPage;
	private List<V> list;
	private int totalPages;
	private int startPage;
	private int endPage;
	public PageList(int total, int currentPage, int size, List<V> list) {
		this.total = total;
		this.currentPage = currentPage;
		this.list = list;
		if(total == 0) {
			totalPages = 0;
			startPage = 0;
			endPage = 0;
		}else {
			totalPages = total/size;
			if(total%size>0) {
				totalPages++;
			}
			int modVal = currentPage%5;//몇페이지까지 보여줄건지
			startPage = currentPage/5*5+1;
			if(modVal==0) startPage-=5;
			endPage = startPage+4;
			if(endPage > totalPages) endPage = totalPages;
		}
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public List<V> getList() {
		return list;
	}
	public void setList(List<V> list) {
		this.list = list;
	}
	public int getTotalPages() {
		return totalPages;
	}
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
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
	public boolean hasNoVs() {
		return total == 0;
	}

	public boolean hasVs() {
		return total > 0;
	}
}
