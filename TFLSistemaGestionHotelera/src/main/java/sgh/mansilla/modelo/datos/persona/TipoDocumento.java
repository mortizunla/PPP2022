package sgh.mansilla.modelo.datos.persona;

import javax.persistence.Transient;

import sgh.mansilla.modelo.dao.Identificable;

public class TipoDocumento implements Identificable<Integer>  {

	Integer idTipoDocumento;
	String descripcion;

	@Transient
	@Override
	public Integer getId() {
		// TODO Auto-generated method stub
		return idTipoDocumento;
	}

	public TipoDocumento() {
	}

	public TipoDocumento(Integer idTipoDocumento, String descripcion) {
		super();
		this.idTipoDocumento = idTipoDocumento;
		this.descripcion = descripcion;
	}

	public Integer getIdTipoDocumento() {
		return idTipoDocumento;
	}

	public void setIdTipoDocumento(Integer idTipoDocumento) {
		this.idTipoDocumento = idTipoDocumento;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

}
