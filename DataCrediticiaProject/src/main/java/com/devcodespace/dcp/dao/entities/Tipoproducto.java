package com.devcodespace.dcp.dao.entities;
// Generated Jul 7, 2015 6:07:19 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 * Tipoproducto generated by hbm2java
 */
@Entity
@Table(name="tipoproducto"
    ,catalog="datacrediticia"
    , uniqueConstraints = @UniqueConstraint(columnNames="tipo") 
)
public class Tipoproducto  implements java.io.Serializable {


     private Integer idtipoproducto;
     private String tipo;
     private String comentario;
     private boolean habilitado;
     private Set historialcrediticios = new HashSet(0);

    public Tipoproducto() {
    }

	
    public Tipoproducto(String tipo, boolean habilitado) {
        this.tipo = tipo;
        this.habilitado = habilitado;
    }
    public Tipoproducto(String tipo, String comentario, boolean habilitado, Set historialcrediticios) {
       this.tipo = tipo;
       this.comentario = comentario;
       this.habilitado = habilitado;
       this.historialcrediticios = historialcrediticios;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="idtipoproducto", unique=true, nullable=false)
    public Integer getIdtipoproducto() {
        return this.idtipoproducto;
    }
    
    public void setIdtipoproducto(Integer idtipoproducto) {
        this.idtipoproducto = idtipoproducto;
    }

    
    @Column(name="tipo", unique=true, nullable=false, length=200)
    public String getTipo() {
        return this.tipo;
    }
    
    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    
    @Column(name="comentario", length=6000)
    public String getComentario() {
        return this.comentario;
    }
    
    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    
    @Column(name="habilitado", nullable=false)
    public boolean isHabilitado() {
        return this.habilitado;
    }
    
    public void setHabilitado(boolean habilitado) {
        this.habilitado = habilitado;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="tipoproducto")
    public Set getHistorialcrediticios() {
        return this.historialcrediticios;
    }
    
    public void setHistorialcrediticios(Set historialcrediticios) {
        this.historialcrediticios = historialcrediticios;
    }




}

