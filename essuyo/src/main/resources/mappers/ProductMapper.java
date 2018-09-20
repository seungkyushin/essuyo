package mappers;

import static mappers.querystring.Product.*;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.webproject.essuyo.domain.ProductVO;

public interface ProductMapper {
	
	// < 회사별 상품리스트
	@Select(SELECT_BY_ID)
	public ProductVO getById(@Param("id") int id);

	
}
