// Copyright (C) 2007-2008 Anders Logg
//
// This file is part of DOLFIN.
//
// DOLFIN is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
//  DOLFIN is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with DOLFIN. If not, see <http://www.gnu.org/licenses/>.
//
// First added:  2007-04-24
// Last changed: 2011-01-25
//
// This demo program demonstrates how to mark sub domains
// of a mesh and store the sub domain markers as a mesh
// function to a DOLFIN XML file.
//
// The sub domain markers produced by this demo program
// are the ones used for the Stokes demo programs.

#include <dolfin.h>
#include <dolfin/io/HDF5File.h>
//#include "Cell.h"

using namespace dolfin;

int main()
{
/*
    Mesh mesh("../../../data/mesh/aaalong.xml");
    MeshFunction<std::size_t> sub_domains_mark(reference_to_no_delete_pointer(mesh), mesh.topology().dim() );
    MeshFunction<std::size_t> boundary_mark(reference_to_no_delete_pointer(mesh), mesh.topology().dim() - 1);

    File file_domain("../../../data/mesh/aaalong_physical_region.xml");
    file_domain >> sub_domains_mark;
    File file_bc("../../../data/mesh/aaalong_facet_region.xml");
    file_bc >> boundary_mark;

    HDF5File filew(MPI_COMM_WORLD,"aaalong.h5","w");
    */

    Mesh mesh("../../../data/mesh/pipe.xml");
    MeshFunction<std::size_t> sub_domains_mark(reference_to_no_delete_pointer(mesh), mesh.topology().dim() );
    MeshFunction<std::size_t> boundary_mark(reference_to_no_delete_pointer(mesh), mesh.topology().dim() - 1);

    File file_domain("../../../data/mesh/pipe_physical_region.xml");
    file_domain >> sub_domains_mark;
    File file_bc("../../../data/mesh/pipe_facet_region.xml");
    file_bc >> boundary_mark;

    HDF5File filew(MPI_COMM_WORLD,"pipe.h5","w");


    filew.write(mesh,"/mesh");
    filew.write(sub_domains_mark,"/subdomains_mark");
    filew.write(boundary_mark,"/facet_mark");
    filew.close();


    plot(mesh);
    plot(sub_domains_mark);
    plot(boundary_mark);
    interactive();



    return 0;


}
