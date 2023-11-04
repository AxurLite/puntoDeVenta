package com.empresa.puntodeventa.util.paginator;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;

public class PageRender<T> {

	private String url;
	private Page<T> page;

	private int totalPaginas;

	private int numElementosPorPagina;

	private int paginaActual;

	private List<PageItem> paginas;

	public PageRender(String url, Page<T> page) {
		this.url = url;
		this.page = page;
		this.paginas = new ArrayList<PageItem>();

		numElementosPorPagina = 6;
		totalPaginas = page.getTotalPages();
		paginaActual = page.getNumber() + 1;

		int desde = calcularDesde();
		int hasta = calcularHasta(desde);

		for (int i = 0; i < hasta; i++) {
			paginas.add(new PageItem(desde + i, paginaActual == desde + i));
		}
	}

	private int calcularDesde() {
		if (totalPaginas <= numElementosPorPagina) {
			return 1;
		}

		if (paginaActual <= numElementosPorPagina / 2) {
			return 1;
		}

		if (paginaActual >= totalPaginas - numElementosPorPagina / 2) {
			return totalPaginas - numElementosPorPagina + 1;
		}

		return paginaActual - numElementosPorPagina / 2;
	}

	private int calcularHasta(int desde) {
		if (totalPaginas <= numElementosPorPagina) {
			return totalPaginas;
		}

		return numElementosPorPagina;
	}


	public String getUrl() {
		return url;
	}

	public int getTotalPaginas() {
		return totalPaginas;
	}

	public int getPaginaActual() {
		return paginaActual;
	}

	public List<PageItem> getPaginas() {
		return paginas;
	}

	public boolean isFirst() {
		return page.isFirst();
	}

	public boolean isLast() {
		return page.isLast();
	}

	public boolean isHasNext() {
		return page.hasNext();
	}

	public boolean isHasPrevious() {
		return page.hasPrevious();
	}

}
